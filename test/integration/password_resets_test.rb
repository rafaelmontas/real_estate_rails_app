require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @agent = agents(:rafael)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    # Invalid email
    post password_resets_path, params: { password_reset: { email: "" } }
    assert_not flash.empty?
    assert_template 'password_resets/new'
    # Valid email
    post password_resets_path, params: { password_reset: { email: @agent.email } }
    assert_not_equal @agent.reset_digest, @agent.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_template 'password_resets/create'
    # Password reset form
    agent = assigns(:agent)
    # Wrong email
    get edit_password_reset_path(agent.reset_token, email: "")
    assert_redirected_to root_url
    # Inactive agent
    agent.toggle!(:activated)
    get edit_password_reset_path(agent.reset_token, email: agent.email)
    assert_redirected_to root_url
    agent.toggle!(:activated)
    # Right email, wrong token
    get edit_password_reset_path("wrong token", email: agent.email)
    assert_redirected_to root_url
    # Right email, right token
    get edit_password_reset_path(agent.reset_token, email: agent.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", agent.email
    # Invalid password & confirmation
    patch password_reset_path(agent.reset_token), params: { email: agent.email,
                                                             agent: { password: 'foobar',
                                                                      password_confirmation: "xcxcxcx" } }
    assert_select 'div#error_explanation'
    # Empty password
    patch password_reset_path(agent.reset_token), params: { email: agent.email,
                                                            agent: { password: "",
                                                                     password_confirmation: "" } }
    assert_select 'div#error_explanation'
    # Valid password & confirmation
    patch password_reset_path, params: { email: agent.email,
                                         agent: { password: "foobar",
                                                  password_confirmation: "foobar" } }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to agent
  end

  test "expired token" do
    get new_password_reset_path
    post password_resets_path, params: { password_reset: { email: @agent.email } }
    @agent = assigns(:agent)
    @agent.update_attribute(:reset_sent_at, 3.hours.ago)
    patch password_reset_path(@agent.reset_token), params: { email: @agent.email,
                                                             agent: { password: "foobar",
                                                                      password_confirmation: "foobar" } }
    assert_response :redirect
    follow_redirect!
    assert_match "expirado", response.body
  end
end

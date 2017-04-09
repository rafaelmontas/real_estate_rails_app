require 'test_helper'

class AgentsSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get agents_signup_path
    assert_select 'form[action="/agents/signup"]'
    assert_no_difference 'Agent.count' do
      post agents_signup_path, params: { agent: { name: " ",
                                           email: "agent@invalid",
                                           phone_number: " ",
                                           alt_phone_number: " ",
                                           password: "foo",
                                           password_confirmation: "foo" } }
    end
    assert_template "agents/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end

  test "valid signup information with account activation" do
    get agents_signup_path
    assert_difference "Agent.count", 1 do
      post agents_signup_path, params: { agent: { name: "Rafael",
                                                  email: "valid@gmail.com",
                                                  phone_number: "80900000",
                                                  alt_phone_number: "8090000",
                                                  password: "foobar",
                                                  password_confirmation: "foobar" } }
    end
    assert_template "agents/create"
    assert_not flash.empty?
    assert_equal 1, ActionMailer::Base.deliveries.size
    agent = assigns(:agent)
    assert_not agent.activated?
    # Try to log in before activation
    log_in_as(agent)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: agent.email)
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(agent.activation_token, email: "wrong")
    assert_not is_logged_in?
    # Valid activation token and email
    get edit_account_activation_path(agent.activation_token, email: agent.email)
    assert agent.reload.activated?
    follow_redirect!
    assert_template "agents/show"
    assert is_logged_in?
    assert_not flash.empty?
  end
end

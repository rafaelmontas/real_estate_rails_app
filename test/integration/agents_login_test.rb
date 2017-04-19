require 'test_helper'

class AgentsLoginTest < ActionDispatch::IntegrationTest

  def setup
    @agent = agents(:rafael)
  end

  test "login with invalid information" do
    get agents_login_path
    assert_template "sessions/new"
    post agents_login_path, params: { session: { email: "invalid@foobar", password: "foo" } }
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get agents_login_path
    post agents_login_path, params: { session: { email: @agent.email, password: "password" } }
    assert_redirected_to private_url
    follow_redirect!
    assert_template "agents/private_show"
    assert_select "a[href=?]", agents_login_path, count: 0
    assert_select "a[href=?]", agents_logout_path
    assert_select "a[href=?]", agent_path(@agent)
  end

  test "login with valid information followed by logout" do
    get agents_login_path
    post agents_login_path, params: { session: { email: @agent.email, password: "password" } }
    assert is_logged_in?
    assert_redirected_to private_url
    follow_redirect!
    assert_template "agents/private_show"
    assert_select "a[href=?]", agents_login_path, count: 0
    assert_select "a[href=?]", agents_logout_path
    assert_select "a[href=?]", agent_path(@agent)
    delete agents_logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate an agent clicking logout in a second window.
    delete agents_logout_path
    follow_redirect!
    assert_select "a[href=?]", agents_login_path
    assert_select "a[href=?]", agents_logout_path, count: 0
    assert_select "a[href=?]", agent_path(@agent), count: 0
  end

  test "login with remembering" do
    log_in_as(@agent, remember_me: '1')
    assert_equal cookies['remember_token'], assigns(:agent).remember_token
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@agent, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@agent, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end

require 'test_helper'

class AgentsLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get agents_login_path
    assert_template "sessions/new"
    post agents_login_path, params: { session: { email: "invalid@foobar", password: "foo" } }
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end

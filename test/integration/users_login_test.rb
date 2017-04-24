require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:rafael)
  end

  test "login with invalid information" do
    get users_login_path
    assert_template "session_users/new"
    post users_login_path, params: { session_user: { email: " ", password: " " } }
    assert_template "session_users/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get users_login_path
    assert_template "session_users/new"
    post users_login_path, params: { session_user: { email: @user.email, password: "password" } }
    assert user_is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", users_login_path, count: 0
    assert_select "a[href=?]", users_logout_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    # log-out
    delete users_logout_path
    assert_not user_is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete users_logout_path
    follow_redirect!
    assert_select "a[href=?]", users_login_path
    assert_select "a[href=?]", users_logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    assert_select "a[href=?]", edit_user_path(@user), count: 0
  end
end

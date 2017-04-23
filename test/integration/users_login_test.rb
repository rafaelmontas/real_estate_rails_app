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

  test "login with valid information" do
    get users_login_path
    assert_template "session_users/new"
    post users_login_path, params: { session_user: { email: @user.email, password: "password" } }
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", users_login_path, count: 0
    assert_select "a[href=?]", users_logout_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
  end
end

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:rafael)
    @other_user = users(:antonio)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to users_login_path
  end

  test "should redirect update when not logged in" do
    patch edit_user_path(@user), params: { user: { name: @user.name,
                                                 email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to users_login_path
  end

  test "should redirect edit when logged in as wrong user" do
    user_log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    user_log_in_as(@other_user)
    patch edit_user_path(@user), params: { user: { name: @user.name,
                                                   email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

end

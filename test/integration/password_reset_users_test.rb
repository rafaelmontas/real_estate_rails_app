require 'test_helper'

class PasswordResetUsersTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:rafael)
  end

  test "password resets" do
    get new_password_reset_user_path
    assert_template 'password_reset_users/new'
    # Invalid email
    post password_reset_users_path, params: { password_reset_user: { email: "" } }
    assert_not flash.empty?
    assert_template 'password_reset_users/new'
    # Valid email
    post password_reset_users_path, params: { password_reset_user: { email: @user.email } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    # Password reset form
    user = assigns(:user)
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'properties/index'

    # Wrong email
    get edit_password_reset_user_path(user.reset_token, email: "")
    assert_redirected_to root_url
    # Right email, wrong token
    get edit_password_reset_user_path("wrong token", email: user.email)
    assert_redirected_to root_url
    # Right email, right token
    get edit_password_reset_user_path(user.reset_token, email: user.email)
    assert_template 'password_reset_users/edit'
    assert_select "input[name=email][type=hidden][value=?]", user.email
    # Invalid password and confirmation
    patch password_reset_user_path(user.reset_token), params: { email: user.email,
                                                                user: { password: "nomatch",
                                                                        password_confirmation: "nomatch2" } }
    assert_select 'div#error_explanation'
    assert_template 'password_reset_users/edit'
    # Empty password
    patch password_reset_user_path(user.reset_token), params: { email: user.email,
                                                                user: { password: "",
                                                                        password_confirmation: "" } }
    assert_select 'div#error_explanation'
    assert_template 'password_reset_users/edit'
    # Valid password and confirmation
    patch password_reset_user_path(user.reset_token), params: { email: user.email,
                                                                user: { password: "validpassword",
                                                                        password_confirmation: "validpassword" } }
    assert user_is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end

  test "expired token" do
    get new_password_reset_user_path
    post password_reset_users_path, params: { password_reset_user: { email: @user.email } }
    @user = assigns(:user)
    @user.update_attribute(:reset_sent_at, 3.hours.ago)
    patch password_reset_user_path(@user.reset_token), params: { email: @user.email,
                                                                user: { password: "validpassword",
                                                                        password_confirmation: "validpassword" } }
    assert_response :redirect
    assert_not flash.empty?
    follow_redirect!
    assert_match "expirado", response.body
  end
end

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rafael)
  end

  test "unsuccessful edit" do
    user_log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch edit_user_path(@user), params: { user: { name: "",
                                                   email: "foo@invalid",
                                                   password: "foo",
                                                   password_confirmation: "bar" } }
    assert_template 'users/edit'
    assert_select 'div.alert', "El formulario contiene 4 errores."
  end

  test "successful edit" do
    user_log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Rafa"
    email = "valid@gmail.com"
    patch edit_user_path(@user), params: { user: { name: name,
                                                   email: email,
                                                   password: "",
                                                   password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    user_log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Rafa"
    email = "valid@gmail.com"
    patch edit_user_path(@user), params: { user: { name: name,
                                                   email: email,
                                                   password: "",
                                                   password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
    assert_nil session[:forwarding_url]
  end
end

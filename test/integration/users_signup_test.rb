require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get users_signup_path
    assert_select "form[action='/users/signup']"
    assert_no_difference "User.count" do
      post users_signup_path, params: { user: { name: "  ",
                                                 email: "invalid@gmail",
                                                 password: "foo",
                                                 password_confirmation: "fo2" } }
    end
    assert_template "users/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end

  test "valid signup information" do
    get users_signup_path
    assert_select "form[action='/users/signup']"
    assert_difference "User.count", 1 do
      post users_signup_path, params: { user: { name: "Rafael",
                                                email: "valid@gmail.com",
                                                password: "foobar",
                                                password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
  end
end

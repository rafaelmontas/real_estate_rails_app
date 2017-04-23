require 'test_helper'

class SessionUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_login_path
    assert_response :success
  end

end

require 'test_helper'

class AgentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_agent_url
    assert_response :success
  end

end

require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get show" do
    get property_url(:id)
    assert_response :success
  end

end

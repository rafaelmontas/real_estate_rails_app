require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @property = properties(:one)
  end

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get index" do
    get properties_path
    assert_response :success
  end

  test "should get show" do
    get property_path(@property)
    assert_response :success
  end

  test "should get new" do
    get new_property_path
    assert_response :success
  end

end

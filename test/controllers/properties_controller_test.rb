require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @agent = agents(:rafael)
    @other_agent = agents(:antonio)
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

  test "should get new when logged in" do
    log_in_as(@agent)
    get new_agent_property_path(@agent)
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get new_agent_property_path(@agent)
    assert_not_empty flash
    assert_response :redirect
    assert_redirected_to agents_login_url
  end

  test "should redirect new when logged in as wrong agent" do
    log_in_as(@other_agent)
    get new_agent_property_path(@agent)
    assert_empty flash
    assert_response :redirect
    assert_redirected_to root_url
  end

  test "should get edit when logged in" do
    log_in_as(@agent)
    get edit_agent_property_path(@agent, @property)
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_agent_property_path(@agent, @property)
    assert_not flash.empty?
    assert_redirected_to agents_login_url
  end

  test "should redirect edit to home when logged in as wrong agent" do
    log_in_as(@other_agent)
    get edit_agent_property_path(@agent, @property)
    assert_empty flash, "flash is not empty"
    assert_response :redirect
    assert_redirected_to root_url
  end

  test "should update when logged in" do
    log_in_as(@agent)
    patch agent_property_path(@agent, @property), params: { property: { room: 1, bath: 2 } }
    assert_not_empty flash, "flash empty"
    assert_response :redirect
    assert_redirected_to private_url

  end

  test "should redirect update when not logged in" do
    patch agent_property_path(@agent, @property), params: { property: { room: 1, bath: 2 } }
    assert_not flash.empty?
    assert_redirected_to agents_login_url
  end

  test "should redirect update to home when logged in as wrong agent" do
    log_in_as(@other_agent)
    patch agent_property_path(@agent, @property), params: { property: { room: 1, bath: 2 } }
    assert_empty flash, "flash is not empty"
    assert_response :redirect
    assert_redirected_to root_url
  end

  test "should destroy when logged in" do
    log_in_as(@agent)
    assert_difference "Property.count", -1 do
      delete agent_property_path(@agent, @property)
    end
    assert_not_empty flash
    assert_response :redirect
    assert_redirected_to private_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Property.count" do
      delete agent_property_path(@agent, @property)
    end
    assert_response :redirect
    assert_redirected_to agents_login_url
  end

  test "should redirect destroy to home when logged in as wrong agent" do
    log_in_as(@other_agent)
    assert_no_difference "Property.count" do
      delete agent_property_path(@agent, @property)
    end
    assert_response :redirect
    assert_redirected_to root_url
  end

end

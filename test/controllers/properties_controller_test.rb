require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @agent = agents(:rafael)
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
    get new_agent_property_path(@agent)
    assert_response :success
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

  test "should redirect update when not logged in" do
    patch agent_property_path(@agent, @property), params: { property: { room: 1, bath: 2 } }
    assert_not flash.empty?
    assert_redirected_to agents_login_url
  end

end

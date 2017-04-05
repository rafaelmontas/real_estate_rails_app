require 'test_helper'

class AgentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @agent = agents(:rafael)
    @other_agent = agents(:antonio)
  end

  test "should get new" do
    get new_agent_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_agent_path(@agent)
    assert_not flash.empty?
    assert_redirected_to agents_login_url
  end

  test "should redirect update when not logged in" do
    patch edit_agent_path(@agent), params: { agent: { name: @agent.name,
                                                      email: @agent.email } }
    assert_not flash.empty?
    assert_redirected_to agents_login_url
  end

  test "should redirect edit when logged in as wrong agent" do
    log_in_as(@other_agent)
    get edit_agent_path(@agent)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong agent" do
    log_in_as(@other_agent)
    patch edit_agent_path(@agent), params: { agent: { name: @agent.name,
                                                      email: @agent.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

end

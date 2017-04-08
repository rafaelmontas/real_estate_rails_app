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

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_agent)
    assert_not @other_agent.admin?
    patch agent_path(@other_agent), params: { agent: { password: "foobar",
                                                      password_confirmation: "foobar",
                                                      admin: true } }
    assert_not @other_agent.reload.admin?
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Agent.count' do
      delete agent_path(@agent)
    end
    assert_redirected_to agents_login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_agent)
    assert_no_difference 'Agent.count' do
      delete agent_path(@agent)
    end
    assert_redirected_to root_url
  end

end

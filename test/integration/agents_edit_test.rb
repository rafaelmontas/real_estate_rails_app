require 'test_helper'

class AgentsEditTest < ActionDispatch::IntegrationTest
  def setup
    @agent = agents(:rafael)
  end

  test "unsuccessful edit" do
    log_in_as(@agent)
    get edit_agent_path(@agent)
    assert_template 'agents/edit'
    patch edit_agent_path(@agent), params: { agent: { name: "",
                                                      email: "foo@invalid",
                                                      password: "foo",
                                                      password_confirmation: "bar" } }
    assert_template 'agents/edit'
    assert_select 'div.alert', "The form contains 4 errors."
  end

  test "successful edit" do
    log_in_as(@agent)
    get edit_agent_path(@agent)
    assert_template 'agents/edit'
    name = "Rafa"
    email = "valid@gmail.com"
    patch edit_agent_path(@agent), params: { agent: { name: name,
                                                      email: email,
                                                      password: "",
                                                      password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to private_path
    @agent.reload
    assert_equal name, @agent.name
    assert_equal email, @agent.email
  end

  test "successful edit with friendly forwarding" do
    get edit_agent_path(@agent)
    log_in_as(@agent)
    assert_redirected_to edit_agent_url(@agent)
    name = "Rafa"
    email = "valid@gmail.com"
    patch edit_agent_path(@agent), params: { agent: { name: name,
                                                      email: email,
                                                      password: "",
                                                      password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to private_path
    @agent.reload
    assert_equal name, @agent.name
    assert_equal email, @agent.email
  end
end

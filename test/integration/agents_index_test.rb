require 'test_helper'

class AgentsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @agent = agents(:rafael)
  end

  test "index including pagination" do
    get agents_path
    assert_template 'agents/index'
    assert_select 'div.pagination'
    assert_select 'a[href=?]', agent_path(@agent), text: @agent.name
  end
  
end

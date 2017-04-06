require 'test_helper'

class AgentsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @agent = agents(:rafael)
  end

  test "index including pagination" do
    get agents_path
    assert_template 'agents/index'
    assert_select 'div.pagination'
    # error
    Agent.paginate(page: 1).each do |agent|
      assert_select 'a[href=?]', agent_path(agent), text: agent.name
    end
  end


end

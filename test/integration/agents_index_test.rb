require 'test_helper'

class AgentsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = agents(:rafael)
    @non_admin = agents(:antonio)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get agents_path
    assert_template 'agents/index'
    assert_select 'div.pagination'
    assert_select 'a[href=?]', agent_path(@non_admin), text: @non_admin.name
    if @admin
      assert_select 'a[href=?]', agent_path(@non_admin), text: "Eliminar"
    end
    assert_difference 'Agent.count', -1 do
      delete agent_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get agents_path
    assert_select 'a', text: "Elimina", count: 0
  end

end

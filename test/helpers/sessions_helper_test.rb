require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @agent = agents(:rafael)
    remember(@agent)
  end

  test "current_agent returns right user when session is nil" do
    assert_equal @agent, current_agent
    assert is_logged_in?
  end

  test "current_agent returns nil when remember digest is wrong" do
    @agent.update_attribute(:remember_digest, Agent.digest(Agent.new_token))
    assert_nil current_agent
  end

end

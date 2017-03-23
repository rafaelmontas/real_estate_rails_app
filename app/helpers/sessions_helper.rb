module SessionsHelper

  # Logs in the given agent.
  def log_in(agent)
    session[:agent_id] = agent.id
  end

  # Returns the current logged-in agent (if any).
  def current_agent
    @current_agent ||= Agent.find_by(id: session[:agent_id])
  end

  # Returns true if the agent is logged in, false otherwise.
  def logged_in?
    !current_agent.nil?
  end

  # logs out the curren agent.
  def log_out
    session.delete(:agent_id)
    @current_agent = nil
  end

end

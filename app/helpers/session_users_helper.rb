module SessionUsersHelper

  # Logs in the given agent.
  def user_log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in agent (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the agent is logged in, false otherwise.
  def user_logged_in?
    !current_user.nil?
  end
end

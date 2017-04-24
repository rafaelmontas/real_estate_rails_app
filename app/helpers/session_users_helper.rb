module SessionUsersHelper

  # Logs in the given agent.
  def user_log_in(user)
    session[:user_id] = user.id
  end

  # Remembers an user in a persistent session.
  def user_remember(user)
    user.remember_user
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in agent (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.user_authenticated?(cookies[:remember_token])
        user_log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the agent is logged in, false otherwise.
  def user_logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session
  def forget_user(user)
    user.forget_user
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # logs out the current user.
  def user_log_out
    forget_user(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end

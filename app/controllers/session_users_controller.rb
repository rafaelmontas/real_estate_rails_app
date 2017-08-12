class SessionUsersController < ApplicationController

  layout "user_signup_login", only: [:new]

  def new
  end

  def create
    @user = User.find_by(email: params[:session_user][:email].downcase)
    if @user && @user.authenticate(params[:session_user][:password])
      user_log_in @user
      params[:session_user][:remember_me] == '1' ? user_remember(@user) : forget_user(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = "Combinación email/contraseña incorrecta"
      render 'new', layout: "user_signup_login"
    end
  end

  def destroy
    user_log_out if user_logged_in?
    redirect_to root_url
  end
end

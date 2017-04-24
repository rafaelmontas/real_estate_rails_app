class SessionUsersController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session_user][:email].downcase)
    if @user && @user.authenticate(params[:session_user][:password])
      user_log_in @user
      params[:session_user][:remember_me] == '1' ? user_remember(@user) : forget_user(@user)
      redirect_to @user
    else
      flash.now[:danger] = "Combinación email/contraseña incorrecta"
      render 'new'
    end
  end

  def destroy
    user_log_out if user_logged_in?
    redirect_to root_url
  end
end

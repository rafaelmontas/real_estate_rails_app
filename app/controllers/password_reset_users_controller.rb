class PasswordResetUsersController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset_user][:email].downcase)
    if @user
      @user.create_reset_digest_user
      @user.send_password_reset_email_user
      flash[:info] = "Email ha sido enviado."
      redirect_to root_url
    else
      flash.now[:danger] = "Email no se encuentra en base de datos."
      render 'new'
    end
  end

  def edit
  end
end

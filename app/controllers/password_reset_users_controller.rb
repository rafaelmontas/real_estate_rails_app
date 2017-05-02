class PasswordResetUsersController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

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

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      user_log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = "Contraseña Actualizada."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless @user && @user.user_authenticated?(:reset, params[:id])
        redirect_to root_url
      end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Link ha expirado. Por favor ingresar email otra vez."
        redirect_to new_password_reset_user_url
      end
    end
end

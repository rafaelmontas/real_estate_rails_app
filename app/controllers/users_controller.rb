class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  layout "user_signup_login", only: [:new]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_welcome_email
      user_log_in @user
      flash[:success] = "Bienvenido"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # correct_user
  end

  def update
    # correct_user
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil actualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    # correct_user
    user_log_out if user_logged_in?
    @user.destroy
    flash[:success] = "Usuario Eliminado."
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless user_logged_in?
        store_location
        flash[:danger] = "Por favor Inicie Sesión."
        redirect_to users_login_path
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end

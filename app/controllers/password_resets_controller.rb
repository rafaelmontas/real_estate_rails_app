class PasswordResetsController < ApplicationController
  before_action :get_agent, only: [:edit, :update]
  before_action :valid_agent, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @agent = Agent.find_by(email: params[:password_reset][:email].downcase)
    if @agent
      @agent.create_reset_digest
      @agent.send_password_reset_email
    else
      flash.now[:danger] = "Email no se encuentra en base de datos."
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:agent][:password].empty?
      @agent.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @agent.update_attributes(agent_params)
      log_in @agent
      @agent.update_attribute(:reset_digest, nil)
      flash[:success] = "Contraseña Actualizada."
      redirect_to @agent
    else
      render 'edit'
    end
  end

  private

    def agent_params
      params.require(:agent).permit(:password, :password_confirmation)
    end

    def get_agent
      @agent = Agent.find_by(email: params[:email])
    end

    # Confirms a valid agent
    def valid_agent
      unless (@agent && @agent.activated? && @agent.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @agent.password_reset_expired?
        flash[:danger] = "Link ha expirado. Por favor ingresar email otra vez."
        redirect_to new_password_reset_url
      end
    end
end

class PasswordResetsController < ApplicationController
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
end

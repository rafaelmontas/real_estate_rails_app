class SessionsController < ApplicationController

  layout "agent_signup_login", only: [:new]
  
  def new
  end

  def create
    @agent = Agent.find_by(email: params[:session][:email].downcase)
    if @agent && @agent.authenticate(params[:session][:password])
      if @agent.activated?
        log_in @agent
        params[:session][:remember_me] == '1' ? remember(@agent) : forget(@agent)
        redirect_back_or private_path
      else
        message = "Cuenta no ha sido activada. "
        message += "Revisar email para link de activación."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Combinación email/contraseña incorrecta"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

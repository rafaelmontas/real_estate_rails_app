class SessionsController < ApplicationController
  
  def new
  end

  def create
    @agent = Agent.find_by(email: params[:session][:email].downcase)
    if @agent && @agent.authenticate(params[:session][:password])
      log_in @agent
      params[:session][:remember_me] == '1' ? remember(@agent) : forget(@agent)
      redirect_back_or @agent
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

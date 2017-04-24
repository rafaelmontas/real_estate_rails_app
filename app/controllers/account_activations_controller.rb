class AccountActivationsController < ApplicationController

  def edit
    agent = Agent.find_by(email: params[:email])
    if agent && !agent.activated? && agent.authenticated?(:activation, params[:id])
      agent.activate
      log_in agent
      flash[:success] = "Cuenta Activada!"
      redirect_to private_url
    else
      flash[:danger] = "Link de Activación Invalido"
      redirect_to root_url
    end
  end
end

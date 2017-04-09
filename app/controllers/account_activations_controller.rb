class AccountActivationsController < ApplicationController

  def edit
    agent = Agent.find_by(email: params[:email])
    if agent && !agent.activated? && agent.authenticated?(:activation, params[:id])
      agent.update_attribute(:activated, true)
      agent.update_attribute(:activated_at, Time.zone.now)
      log_in agent
      flash[:success] = "Cuenta Activada!"
      redirect_to agent
    else
      flash[:danger] = "Link de Activación Invalido"
      redirect_to root_url
    end
  end
end

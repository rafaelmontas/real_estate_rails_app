class AgentsController < ApplicationController

  def show
    @agent = Agent.find(params[:id])
  end

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      flash[:success] = "Bienvenido a TuCasa.com"
      redirect_to @agent
    else
      render 'new'
    end
  end



  private

    def agent_params
      params.require(:agent).permit(:name, :email, :phone_number, :alt_phone_number, :avatar, :password, :password_confirmation)
    end
end

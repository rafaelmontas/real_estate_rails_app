class AgentsController < ApplicationController
  before_action :logged_in_agent, only: [:edit, :update, :destroy]
  before_action :correct_agent, only: [:edit, :update]
  before_action :admin_agent, only: [:destroy]

  def index
    @agents = Agent.paginate(page: params[:page], per_page: 6)
  end

  def show
    @agent = Agent.find(params[:id])
  end

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      AgentMailer.account_activation(@agent).deliver_now
      flash[:info] = "Por favor revisar email para activar cuenta."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @agent.update_attributes(agent_params)
      flash[:success] = "Perfil actualizado"
      redirect_to @agent
    else
      render 'edit'
    end
  end

  def destroy
    Agent.find(params[:id]).destroy
    flash[:success] = "Agente Eliminado"
    redirect_to agents_url
  end



  private

    def agent_params
      params.require(:agent).permit(:name, :email, :phone_number, :alt_phone_number, :avatar, :password, :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in agent.
    def logged_in_agent
      unless logged_in?
        store_location
        flash[:danger] = "Por favor Inicie Sesión."
        redirect_to agents_login_url
      end
    end

    # Confirms the correct agent.
    def correct_agent
      @agent = Agent.find(params[:id])
      redirect_to(root_url) unless current_agent?(@agent)
    end

    # Confirms an admin agent
    def admin_agent
      redirect_to(root_url) unless current_agent.admin?
    end
end

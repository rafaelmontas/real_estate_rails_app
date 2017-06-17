class PropertiesController < ApplicationController
  before_action :set_agent, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_property, only: [:edit, :update, :destroy]
  before_action :logged_in_agent, only: [:edit, :update]
  # before_action :correct_agent

  def index
    @q = Property.ransack(params[:q])
    @properties = @q.result.paginate(page: params[:page], per_page: 4)
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = @agent.properties.new(property_params)
    if @property.save
      flash[:success] = "Propiedad enviada para validación!"
      redirect_to @property
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @property.update_attributes(property_params)
      flash[:success] = "Propiedad actualizada"
      redirect_to private_path
    else
      render 'edit'
    end
  end


  private

    def property_params
      params.require(:property).permit(:name, :address, :price, :sale, :kind, :room, :bath, :parking, :mts, :location, :general)
    end

    def set_agent
      @agent = Agent.find(params[:agent_id])
    end

    def set_property
      @property = @agent.properties.find(params[:id])
    end

    # Confirms a logged-in agent.
    def logged_in_agent
      unless logged_in?
        store_location
        flash[:danger] = "Por favor Inicie Sesión."
        redirect_to agents_login_url
      end
    end
end

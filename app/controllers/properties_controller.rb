class PropertiesController < ApplicationController
  before_action :set_agent, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_property, only: [:edit, :update, :destroy]
  before_action :logged_in_agent, only: [:new, :edit, :update, :destroy]
  before_action :correct_agent, only: [:new, :edit, :update, :destroy]

  layout "private_show", only: [:new, :edit, :create]

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
    render 'new' unless @property.save
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

  def destroy
    @property.destroy
    flash[:success] = "Propiedad Eliminada"
    redirect_to private_url
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

    def correct_agent
      redirect_to(root_url) unless current_agent?(@agent)
    end
end

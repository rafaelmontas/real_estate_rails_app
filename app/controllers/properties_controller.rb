class PropertiesController < ApplicationController

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
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "Propiedad enviada para validación!"
      redirect_to @property
    else
      render 'new'
    end
  end


  private

    def property_params
      params.require(:property).permit(:name, :address, :price, :sale, :kind, :room, :bath, :parking, :mts, :location, :general)
    end
end

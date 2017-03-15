class PropertiesController < ApplicationController

  def index
    @properties = Property.all
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
      redirect_to @property
    else
      render 'new'
    end
  end


  private

    def property_params
      params.require(:property).permit(:name, :address, :price, :sale, :kind, :room, :bath, :parking, :mts, :location, :tags, :general, :image)
    end
end

class StaticPagesController < ApplicationController
  def home
    @properties = Property.last(10)
  end

  def show
    @property = Property.find(params[:id])
  end
end

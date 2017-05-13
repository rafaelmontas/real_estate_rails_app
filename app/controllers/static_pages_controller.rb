class StaticPagesController < ApplicationController
  def home
    @q = Property.ransack(params[:q])
    @properties = @q.result
    @featured_properties = Property.last(10)
  end

  def show
    @property = Property.find(params[:id])
  end
end

class Properties::LikesController < ApplicationController
  before_action :logged_in_user
  before_action :set_property

  def create
    @property.likes.where(user_id: current_user).first_or_create

    respond_to do |format|
      format.html { redirect_to @property }
      format.js
    end
  end

  def destroy
    @property.likes.where(user_id: current_user).destroy_all

    respond_to do |format|
      format.html { redirect_to @property }
      format.js
    end
  end

  private

    def set_property
      @property = Property.find(params[:property_id])
    end

    # Confirms a logged-in agent.
    def logged_in_user
      unless user_logged_in?
        store_location
        flash[:danger] = "Por favor Inicie Sesión."
        redirect_to users_login_url
      end
    end
end

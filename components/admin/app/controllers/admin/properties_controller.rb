require_dependency 'admin/application_controller'

module Admin
  class PropertiesController < ApplicationController
    
    def index
    end

    def new
      @property = Property.new
    end

    def create
      @property = Property.new(set_params)

      if @property.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:property).permit(:name)
    end

  end
end
require_dependency 'site/application_controller'

module Site
  class PropertiesController < ApplicationController

    def index
    end
    
    def show
      @property = Property.where(status: true).find(params[:id])
    end

  end
end
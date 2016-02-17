require_dependency 'site/application_controller'

module Site
  class PropertiesController < ApplicationController

    has_scope :by_situation
    has_scope :by_type

    def index
    end
    
    def show
      @property = Property.where(status: true).find(params[:id])
    end

    def search
      @properties = apply_scopes(Property).all.order(:address)
    end
  end
end
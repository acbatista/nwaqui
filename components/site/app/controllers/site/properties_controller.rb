require_dependency 'site/application_controller'

module Site
  class PropertiesController < ApplicationController

    has_scope :by_commercial
    has_scope :by_type
    has_scope :by_client
    has_scope :by_group
    has_scope :by_block
    has_scope :by_situation
    

    def index
    end
    
    def show
      @property = Property.where(status: true).find(params[:id])
    end

    def search
      @properties = apply_scopes(Property).all.order(:general_address)
    end

    def telephone
      @property = Property.where(status: true).find(params[:property_id])
    end

  end
end
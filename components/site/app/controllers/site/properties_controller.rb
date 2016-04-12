require_dependency 'site/application_controller'

module Site
  class PropertiesController < ApplicationController

    has_scope :by_commercial
    has_scope :by_type
    has_scope :by_area
    has_scope :by_client
    has_scope :by_detail_group
    has_scope :by_block
    has_scope :by_situation
    has_scope :by_room
    has_scope :by_order
    

    def index
    end
    
    def show
      @property = Property.where(status: true).find(params[:id])
    end

    def search
      @properties = apply_scopes(Property).all
    end

    def telephone
      @property = Property.where(status: true).find(params[:property_id])
    end

    def group
      if !params[:group_id].present?
        render json: nil
      else
        group = params[:group_id]
        group = group.split('_') 
        group = "#{group[1]} #{group[0][0]}"
  
        @groups = Group.where("name LIKE '%#{group}%'")
        render json: @groups
      end
    end

  end
end
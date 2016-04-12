require_dependency 'site/application_controller'

module Site
  class ListsController < ApplicationController
    layout 'site/application-less'
    
    has_scope :by_block
    has_scope :by_group
    has_scope :by_type
    has_scope :by_client
    has_scope :by_commercial

    def index
      @properties = apply_scopes(::Property).where(status: true, address_id: current_domain.addresses)
      
      case params[:filter_order]
      when 'value'
        @properties = @properties.order([:value, :value_rent])
      when 'address'
        @properties = @properties.includes(:group).order('groups.name ASC')
      when 'meter'
        @properties = @properties.order('area ASC')
      else
        @properties = @properties.order([:customer_id, :id])
      end
    end

  end
end
require_dependency 'site/application_controller'

module Site
  class ListsController < ApplicationController
    layout 'site/application-less'
    
    has_scope :by_block
    has_scope :by_group
    has_scope :by_type
    has_scope :by_client

    def index
      @properties = apply_scopes(::Property).all
    end

  end
end
require_dependency 'admin/application_controller'

module Admin
  class PagesController < ApplicationController 

    def index
      @customers  = ::Customer.all.count
      @properties = ::Property.all.count
    end
    
  end
end
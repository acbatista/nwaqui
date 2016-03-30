require_dependency 'client/application_controller'

module Client
  class PagesController < ApplicationController 
    
    def index
      @dashboard = true
    end
    
  end
end
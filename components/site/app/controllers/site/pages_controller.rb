require_dependency 'site/application_controller'

module Site
  class PagesController < ApplicationController 
    
    def index
      render :json => "em processo de deploy..."
    end
    
  end
end
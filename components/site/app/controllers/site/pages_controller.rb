require_dependency 'site/application_controller'

module Site
  class PagesController < ApplicationController 
    
    def index
    end
    
    def show
      @page = ::Page.friendly.find(params[:id])
    end

  end
end
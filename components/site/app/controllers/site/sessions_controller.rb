require_dependency 'site/application_controller'

module Site
  class SessionsController < ApplicationController
    
    def new 
      @session = Site::Session.new
    end

    def create
      @session = Site::Session.new(set_params)
      if @session.valid?
        session[:external_user_id]    = @session.id
        session[:external_user_time]  = Time.now + 4.hours
      end
    end

    def logout
      session[:external_user_id]    = nil
      session[:external_user_time]  = nil

      redirect_to site.root_path
    end
    
    private

    def set_params
      params.require(:session).permit(:username, :password)
    end
  end
end
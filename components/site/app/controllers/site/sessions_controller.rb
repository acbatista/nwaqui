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

    def remember
    end
    
    def logout
      session[:external_user_id]    = nil
      session[:external_user_time]  = nil

      redirect_to site.root_path
    end

    def omniauth_create
      user = ExternalUser.from_omniauth(env["omniauth.auth"])
      session[:external_user_id] = user.id
      redirect_to root_url, notice: "Signed in!"
    end

    def omniauth_destroy
      session[:external_user_id] = nil
      redirect_to root_url, notice: "Signed in!"
    end

    def omniatuh_failure
      redirect_to root_url, alert: "Authentication failed, please try again."
    end

    def gmail_session_create
      @auth = request.env['omniauth.auth']['credentials']
    end

    private

    def set_params
      params.require(:session).permit(:username, :password)
    end
  end
end
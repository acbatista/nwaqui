module Site
  class ApplicationController < ActionController::Base
    layout :set_layout

    helper SessionHelper
    include SessionHelper
    

    def touch_device?
      user_agent = request.headers["HTTP_USER_AGENT"]
      user_agent.present? && user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
    end
    
    helper_method :touch_device?

    private

    def set_layout
      touch_device? ? 'site/mobile' : 'site/application'
    end

    def validate_session!
      if !session[:external_user_id].present? and !session_controller?
        redirect_to site.root_path
      end
    end



    def session_controller?
      controller_name == "sessions"
    end
  end
end

module Site
  class ApplicationController < ActionController::Base
    layout :domain?

    DOMAINS = %w(nwaqui asaaqui gamaaaqui)

    helper SessionHelper
    include SessionHelper
    

    def touch_device?
      user_agent = request.headers["HTTP_USER_AGENT"]
      user_agent.present? && user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
    end
    
    helper_method :touch_device?

    private

    def domain?

      @layout = "site/templates/dfaqui/application"
      
      DOMAINS.each do |domain|
        @layout = "site/templates/#{domain}/application" if request.url.include? domain 
      end    

      return @layout
    end

    helper_method :domain?

    #def set_layout
    #  touch_device? ? 'site/mobile' : 'site/application'
    #end

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

module Site
  class ApplicationController < ActionController::Base
    layout :set_layout

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

      @domain = "dfaqui"
      
      DOMAINS.each do |domain|
        @domain = domain if request.url.include? domain 
      end    

      @domain
    end

    def current_domain
      ::RegionScope.find_by_domain(domain?)
    end

    def set_layout
      layout = domain?

      if touch_device?
        "site/templates/#{layout}/mobile"
      else
        "site/templates/#{layout}/application"
      end
    end

    helper_method :domain?
    helper_method :current_domain


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

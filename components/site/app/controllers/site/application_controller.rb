module Site
  class ApplicationController < ActionController::Base
    layout 'site/application'


    helper SessionHelper
    include SessionHelper
    
    private

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

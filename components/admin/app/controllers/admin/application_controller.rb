require_dependency 'admin/session_helper'

module Admin
  class ApplicationController < ActionController::Base
    before_filter :validate_session!

    helper SessionHelper
    include SessionHelper
    
    private

    def validate_session!
      if !session[:admin_id].present? and !session_controller?
        redirect_to new_session_path
      end
    end

    def session_controller?
      controller_name == "sessions"
    end
  end
end

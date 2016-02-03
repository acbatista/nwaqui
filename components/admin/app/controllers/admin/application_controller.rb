module Admin
  class ApplicationController < ActionController::Base
    before_filter :validate_session!

    private

    def validate_session!
      if !session[:admin_id].present? and !session_controller?
        redirect_to new_session_path
      end
    end

    def session_controller?
    end
  end
end

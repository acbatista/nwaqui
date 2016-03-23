require_dependency 'client/session_helper'

module Client
  class ApplicationController < ActionController::Base
    layout 'client/application'

    before_action :validate_session!

    helper Client::SessionHelper
    include Client::SessionHelper
    
    private

    def validate_session!
      if !session[:client_id].present? and !session_controller?
        redirect_to new_session_path
      end
    end

    def session_controller?
      controller_name == "sessions"
    end
  end
end

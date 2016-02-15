require_dependency 'site/application_controller'

module Site
  class BookmarksController < ApplicationController
    layout 'site/bookmark'
    before_filter :validate_session!

    before_action :set_user

    def index
      
    end

    private

    def set_user
      @user = Site::ExternalUser.find(session[:external_user_id])
    end
  end
end
require_dependency 'site/application_controller'

module Site
  class ExternalUsersController < ApplicationController
    
    def new
      @user = Site::ExternalUser.new
    end

    def create
      @user = Site::ExternalUser.new(set_params)
      @user.save
    end

    private

    def set_params
      params.require(:external_user).permit(:email, :password, :username, :password_confirmation)
    end
    
  end
end
require_dependency 'site/application_controller'

module Site
  class ExternalUsersController < ApplicationController
    
    def new
      @user = Site::ExternalUser.new
    end

    def create
      @user = Site::ExternalUser.new(set_params)
      session[:external_user_id] = @user.id if @user.save

    end

    private

    def set_params
      params.require(:external_user).permit(:email, :password_digest, :password_confirmation)
    end
    
  end
end
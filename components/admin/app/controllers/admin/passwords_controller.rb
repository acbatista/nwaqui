require_dependency 'admin/application_controller'

module Admin
  class PasswordsController < ApplicationController 

    def edit
      @user = Admin::Password.new
    end

    def update
      @user = Admin::Password.new(set_params)
      @user.id = current_user.id

      if @user.valid?
        @user.update_password
        flash[:success] = t :success
        redirect_to action: :edit
      else
        render action: :edit
      end
    end

    private


    def set_params
      params.require(:password).permit(:password, :password_confirmation, :current_password)
    end
    
  end
end
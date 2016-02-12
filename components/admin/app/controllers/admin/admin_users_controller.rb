require_dependency 'admin/application_controller'

module Admin
  class AdminUsersController < ApplicationController 
    before_action :set_admin_user, only: [:edit, :update, :destroy]

    def index 
      @admins = AdminUser.all.order(:name)
    end

    def new
      @admin = AdminUser.new
    end

    def create
      @admin = AdminUser.new(set_params)

      if @admin.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @admin.update(set_update_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end
    
    def destroy
      @admin.destroy 
      flash[:success] = t :success
      redirect_to action: :index
    end

    private

    def set_admin_user
      @admin = AdminUser.find(params[:id])  
    end
    
    def set_params
      params.require(:admin_user).permit(:name, :bio, :email, :telephone, :avatar, :username, 
                                         :password, :password_confirmation)
    end

    def set_update_params
      params.require(:admin_user).permit(:name, :bio, :email, :telephone, :avatar, :username) 
    end
  end
end
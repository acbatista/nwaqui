require_dependency 'admin/application_controller'

module Admin
  class CustomerUsersController < ApplicationController
    
    def index
      @users = CustomerUser.all.order(:name)
    end

    def new
      @user = CustomerUser.new
    end

    def create
      @user = CustomerUser.new(set_params)
    end

    def edit
    end

    private

    def set_customer_user
      @user = CustomerUser.find(params[:id])
    end

   def set_params
      params.require(:customer_user).permit(:name, :bio, :email, :telephone, :avatar, :username) 
    end


  end
end
require_dependency 'admin/application_controller'

module Admin
  class CustomerUsersController < ApplicationController
    before_action :set_customer_user, only: [:edit, :update, :destroy]

    def index
      @users = CustomerUser.all.order(:name)
    end

    def new
      @user = CustomerUser.new
    end

    def create
      @user = CustomerUser.new(set_params)

      if @user.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @user.update(set_update_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end
    
    def destroy
      @user.destroy 
      flash[:success] = t :success
      redirect_to action: :index
    end


    private

    def set_customer_user
      @user = CustomerUser.find(params[:id])
    end

    def set_params
      params.require(:customer_user).permit(:name, :bio, :email, :telephone, :avatar, :username,
                                            :password, :password_confirmation, :status, customer_id: []) 
    end

    
    def set_update_params
      params.require(:customer_user).permit(:name, :bio, :email, :telephone, :avatar, :username, :status, customer_id: []) 
    end


  end
end
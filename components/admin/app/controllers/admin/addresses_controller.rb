require_dependency 'admin/application_controller'

module Admin
  class AddressesController < ApplicationController
    before_action :set_addresses
    before_action :set_address, only: [:edit, :update, :destroy]
    
    def index
    end

    def new
      @address = Address.new
    end

    def create
      @address = Address.new(set_params)
      @address.save
    end

    def edit
    end

    def update
      @address.update(set_params)
    end

    def destroy
      @address.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end

    private

    def set_params
      params.require(:address).permit(:name, :region)
    end

    def set_address
      @address = Address.find(params[:id])
    end

    def set_addresses
      @addresses = Address.all.order(:id)
    end
    
  end
end
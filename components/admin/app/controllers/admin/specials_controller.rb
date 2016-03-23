require_dependency 'admin/application_controller'

module Admin
  class SpecialsController < ApplicationController 
    before_action :set_special, only: [:update, :edit, :destroy]
    before_action :set_specials

    def index
    end
    
    def new
      @special = Special.new
    end

    def create
      @special = Special.new(set_params)
      @special.save
    end

    def edit
    end

    def update
      @special.update(set_params)
    end

    def destroy
      @special.destroy
    end

    private

    def set_special
      @special = Special.find(params[:id])
    end

    def set_params
      params.require(:special).permit(:order, :property_id, :status)
    end

    def set_specials
      @specials = Special.all.order(:order)
    end
  end
end
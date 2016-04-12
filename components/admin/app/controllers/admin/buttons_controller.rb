require_dependency 'admin/application_controller'

module Admin
  class ButtonsController < ApplicationController
    before_action :set_button, only: [:edit, :update, :destroy]
    
    def index
      @buttons = Button.all.order(:order)
    end

    def new
      @button = Button.new
    end

    def create
      @button = Button.new(set_params)
      @button.save
    end

    def edit
    end

    def update
      @button.update(set_params)
    end

    def destroy
      @button.destroy 
      flash[:success] = t :success
      redirect_to action: :index    
    end

    private

    def set_params
      params.require(:button).permit(:name, :image, :publish, :order, :link, :region_scope_id)
    end

    def set_button
      @button = Button.find(params[:id])
    end
  end
end
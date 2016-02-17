require_dependency 'admin/application_controller'

module Admin
  class AttributesController < ApplicationController 
    before_action :set_attribute, only: [:edit, :update, :destroy]
    
    def index
      @attribute = Attribute.new
      @attributes = Attribute.all.order(:id)
    end

    def new
      @attribute = Attribute.new
    end

    def create
      @attribute = Attribute.new(set_params)
      @attributes = Attribute.all.order(:id)
      
      if @attribute.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :index
      end
      
    end
    
    def update
      if @attribute.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      @attribute.destroy
      flash[:success] = t :success
      redirect_to action: :index
    end

    private

    def set_attribute
      @attribute = Attribute.find(params[:id])
    end

    def set_params
      params.require(:attribute).permit(:name)
    end
    
  end
end
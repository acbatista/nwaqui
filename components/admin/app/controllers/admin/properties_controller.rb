require_dependency 'admin/application_controller'

module Admin
  class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]

    has_scope :by_customer
    
    def index
      @properties = apply_scopes(Property).all.order('id DESC')
    end

    def new
      @property = Property.new
    end

    def show
    end

    def create
      @property = Property.new(set_params)

      if @property.save!
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @property.update(set_params) 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      @property.destroy 
      flash[:success] = t :success
      redirect_to action: :index
    end

    private

    def set_property
      @property = Property.find(params[:id])
    end

    def set_params
      params.require(:property).permit(:customer_id, :project_id, :situation, :type_property, :status, :description, :rooms, 
                                       :unit, :value, :suit, :value_m2, :area, :parking_spaces, :floor, :sun_position, :value_rent,
                                       :link_tour, :commercial, :elevator, :coverage,:name, :commercial_situation,
                                       :address_base, :group_base, :address_block, :block_id, :city, :region,  :group, :address, :complement,
                                       :number, :reference_point, property_attributes_id: [], property_attribute_id: [])
    end

  end
end
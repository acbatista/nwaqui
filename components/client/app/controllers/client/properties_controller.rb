require_dependency 'client/application_controller'

module Client
  class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]

    has_scope :by_type
    has_scope :by_situation


    def index
      @properties = apply_scopes(Property).where(customer_id: current_user.id).order('id DESC')
    end

    def new
      @property =  Property.where(customer_id: current_user.id).new
    end

    def show
    end

    def create
      @property = Property.where(customer_id: current_user.id).new(set_params)

      if @property.save 
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
      @property = Property.where(customer_id: current_user.id).find(params[:id])
    end

    def set_params
      params.require(:property).permit(:situation, :type_property, :status, :description, :rooms, 
                                       :unit, :value, :suit, :value_m2, :area, :parking_spaces, :floor, :sun_position, :value_rent,
                                       :link_tour, :commercial, :elevator, :coverage,:name, :commercial_situation, :general_block,
                                       :general_address, :general_group, :group_id, :prediction, :address_id, :block_id, :city, :region, :complement,
                                       :number, :reference_point, property_attributes_id: [], property_attribute_id: [], company_id: [])
    end

  end
end
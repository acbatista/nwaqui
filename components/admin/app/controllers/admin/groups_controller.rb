require_dependency 'admin/application_controller'

module Admin
  class GroupsController < ApplicationController
    before_action :set_address
    before_action :set_groups
    before_action :set_group, only: [:edit, :update, :destroy]
    
    def index
    end

    def new
      @group = @address.groups.new
    end

    def create
      @group = @address.groups.new(set_params)
      @group.save
    end

    def edit
    end

    def update
      @group.update(set_params)
    end

    def destroy
      @group.destroy 
      flash[:success] = t :success
      redirect_to action: :index, address_id: @address.id
    end

    private

    def set_params
      params.require(:group).permit(:name, :tour_360)
    end

    def set_address
      @address = Address.find(params[:address_id])
    end

    def set_groups
      @groups = @address.groups
    end

    def set_group
      @group = @address.groups.find(params[:id])
    end
    
  end
end
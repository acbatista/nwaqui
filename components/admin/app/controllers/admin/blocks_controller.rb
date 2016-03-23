require_dependency 'admin/application_controller'

module Admin
  class BlocksController < ApplicationController
    before_action :set_address
    before_action :set_group
    before_action :set_blocks
    before_action :set_block, only: [:edit, :update, :destroy]
    
    def index
    end

    def new
      @block = @group.blocks.new
    end

    def create
      @block = @group.blocks.new(set_params)
      @block.save
    end

    def edit
    end

    def update
      @block.update(set_params)
    end

    def destroy
      @block.destroy 
      flash[:success] = t :success
      redirect_to action: :index
    end

    private

    def set_params
      params.require(:block).permit(:name, :name, :complete_address, :reference_point, :cep, :tour_360)
    end

    def set_block
      @block = @group.blocks.find(params[:id])
    end

    def set_blocks
      @blocks = @group.blocks
    end

    def set_group
      @group = @address.groups.find(params[:group_id])
    end

    def set_address
      @address = Address.find(params[:address_id])
    end
    
  end
end
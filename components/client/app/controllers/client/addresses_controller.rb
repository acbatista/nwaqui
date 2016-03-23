require_dependency 'admin/application_controller'

module Client
  class AddressesController < ApplicationController

    def groups
      @groups = Group.where(address_id: params[:address_id])

      render json: @groups
    end

    def blocks
      @blocks = Block.where(group_id: params[:group_id])
      render json: @blocks
    end

    def block
      @block    = Block.find(params[:id]) rescue nil
      @group    = @block.group
      @address  = @group.address
      render json: [@block, @group, @address]
    end
    
  end
end
require_dependency 'admin/application_controller'

module Admin
  class RegionScopesController < ApplicationController
    before_action :set_regions
    before_action :set_region, only: [:edit, :update]

    def index
    end

    def new
      @region = RegionScope.new
    end

    def create
      @region = RegionScope.new(set_params)
      @region.save
    end

    def edit
    end

    def update
      @region.update(set_params)
    end

    private

    def set_params
      params.require(:region_scope).permit(:domain, :name)
    end

    def set_region
      @region = RegionScope.find(params[:id])
    end

    def set_regions
      @regions = RegionScope.all.order(:id)
    end
  end
end
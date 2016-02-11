require_dependency 'admin/application_controller'

module Admin
  class ProjectsController < ApplicationController 
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = Project.all
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(set_params)

      if @project.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @project.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index 
      else
        render action: :edit
      end
    end

    def destroy
      @project.destroy
      flash[:success] = t :success
      redirect_to action: :index
    end

    private

    def set_params
      params.require(:project).permit(:customer_id, :name, :description, :status, :logo_path)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    
  end
end
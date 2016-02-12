require_dependency 'admin/application_controller'

module Admin
  class ProjectsController < ApplicationController 
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    has_scope :by_customer
    has_scope :by_status, type: :boolean

    def index
      @projects = apply_scopes(Project).all.order(:name)

      respond_to do |format|
        format.html { @projects }
        format.json { render json: @projects }
      end
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
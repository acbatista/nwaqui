require_dependency 'admin/application_controller'

module Admin
  class PagesController < ApplicationController 
    before_action :set_page, only: [:edit, :update, :destroy]

    def home 
      @customers  = ::Customer.all.count
      @properties = ::Property.all.count
    end
    
    def index
      @pages = ::Page.all
    end
    
    def new
      @page = ::Page.new
    end

    def create
      @page = ::Page.new(set_params)

      if @page.save 
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @page.update(set_params) 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      @page.destroy
      flash[:success] = t :success 
      redirect_to action: :index
    end

    private

    def set_params
      params.require(:page).permit(:title, :content, :code, :publish)
    end

    def set_page
      @page = ::Page.friendly.find(params[:id])
    end
  end
end
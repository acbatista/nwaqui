require_dependency 'admin/application_controller'

module Admin
  class CustomersController < ApplicationController
    before_action :set_customer, only: [:show, :edit, :update, :destroy]

    def index
      @customers = Customer.all
    end

    def show
    end

    def new
      @customer = Customer.new
    end

    def create
      @customer = Customer.new(set_params)
      
      if @customer.save
        flash[:success] = t :success
        redirect_to action: :index
      else 
        render action: :new
      end
    end

    def edit
    end

    def update
      if @customer.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else 
        render action: :new
      end
    end

    def destroy
      @customer.destroy
      flash[:success] = t :success
      redirect_to action: :index
    end

    private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_params
      params.require(:customer).permit(:logo_path, :social_reason, :fantasy_name,
                                       :cnpj, :cpf, :type_client, :address, :cep, :uf,
                                       :city, :contact_email, :cadastre_email, :telephone,
                                       :celphone, :responsible_telephone, :responsible_name)
    end

  end
end
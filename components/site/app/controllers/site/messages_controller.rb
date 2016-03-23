require_dependency 'site/application_controller'

module Site
  class MessagesController < ApplicationController
    before_action :set_customer

    def new
      @message = @customer.messages.new
    end

    def create
      @message = @customer.messages.new(set_params)
      @message.save
    end
      
    private

    def set_params
      params.require(:message).permit(:name, :email, :telephone, :celphone, :content)
    end

    def set_customer
      @property = ::Property.find(params[:property_id])
      @customer = ::Customer.find(@property.customer_id)
    end
  end
end
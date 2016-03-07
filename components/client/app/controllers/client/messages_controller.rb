require_dependency 'client/application_controller'

module Client
  class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :read, :unread]

    has_scope :by_situation

    def index
      @messages = apply_scopes(::Message).all.order('created_at DESC')
    end

    def new
      @message  = ::Message.new
    end

    def create
      @message  = ::Message.new(set_params)
    end

    def show
    end

    def read
      @message.update(read: true)
      redirect_to action: :index
    end

    def unread
      @message.update(read: false)
      redirect_to action: :index
    end

    private

    def set_message
      @message = ::Message.where(customer_id: current_user.id).find(params[:message_id])
    end
  end
end
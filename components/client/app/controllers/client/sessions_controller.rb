require_dependency 'client/application_controller'

module Client
  class SessionsController < ApplicationController
    layout 'client/session'

    def new
      @session = Client::Session.new
    end

    def create
      @session = Session.new(set_params)

      if @session.valid?
        session[:client_id] = @session.id
        session[:client_time_session] = Time.now
        redirect_to client.root_path
      else
        render action: :new
      end
    end


    def logout
      session[:client_id] = nil
      session[:client_time_session] = nil
      redirect_to action: :new
    end
    

    private

    def set_params
      params.require(:session).permit(:username, :password)
    end
  end
end
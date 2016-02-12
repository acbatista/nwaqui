require_dependency 'admin/application_controller'

module Admin
  class SessionsController < ApplicationController
    layout 'admin/session'

    def new
      @session = Session.new
    end

    def create
      @session = Session.new(set_params)

      if @session.valid?
        session[:admin_id] = @session.id
        session[:admin_time_session] = Time.now
        redirect_to admin.root_path
      else
        render action: :new
      end
    end


    def logout
      session[:admin_id] = nil
      session[:admin_time_session] = nil
      redirect_to action: :new
    end
    
    private 

    def set_params
      params.require(:session).permit(:username, :password)
    end
  end
end
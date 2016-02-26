module Client
  module SessionHelper

    def current_user
      Client::Customer.find(session[:client_id]) rescue nil
    end

    def user_signed_in?
      current_user.present?
    end

  end
end

module Admin
  module SessionHelper

    def current_user
      Admin::AdminUser.find(session[:admin_id]) rescue nil
    end

    def user_signed_in?
      current_user.present?
    end

  end
end

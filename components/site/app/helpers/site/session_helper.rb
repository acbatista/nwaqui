module Site
  module SessionHelper

    def bookmark_user
      Site::ExternalUser.find(session[:external_user_id]) rescue nil
    end
  end
end

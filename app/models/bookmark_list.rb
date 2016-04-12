class BookmarkList < ActiveRecord::Base
  belongs_to :user, class_name: "Site::ExternalUser"
end

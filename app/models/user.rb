class User < ActiveRecord::Base
  has_many :bookmarks

  scope :bookmark_users, -> { where(user_type: 2)}
  scope :admin_users, -> { where(user_type: 0)}

  attr_accessor :password_confirmation
end

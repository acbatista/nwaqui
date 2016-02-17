class User < ActiveRecord::Base
  has_many :bookmarks

  attr_accessor :password_confirmation
end

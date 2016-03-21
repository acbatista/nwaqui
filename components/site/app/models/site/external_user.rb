module Site
  class ExternalUser < ::ExternalUser
    has_many :bookmarks, foreign_key: 'user_id'
  end
end
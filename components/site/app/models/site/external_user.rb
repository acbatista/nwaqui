module Site
  class ExternalUser < ::User

    default_scope { where(user_type: 2)}
  
        
    validates :email, email: true, presence: true
    validates_uniqueness_of :email, scope: :user_type 
    validates_uniqueness_of :username, scope: :user_type 
    validates :username, presence: true, uniqueness: true
    validates :password, :password_confirmation, presence: true


    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end

  end
end
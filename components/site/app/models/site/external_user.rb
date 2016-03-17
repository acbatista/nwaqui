module Site
  class ExternalUser < ::User

    default_scope { where(user_type: 2)}
  
        
    validates :email, email: true, presence: true
    validates_uniqueness_of :email, scope: :user_type 
    validates_uniqueness_of :username, scope: :user_type 
    validates :username, presence: true, uniqueness: true
    validates :password, :password_confirmation, presence: true


    def self.from_omniauth(auth)
      find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
    end

    def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
      end
    end
  end
end
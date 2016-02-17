module Site
  class ExternalUser < ::User

    default_scope { where(user_type: 2)}
  
        
    validates :email, email: true, presence: true
    validates_uniqueness_of :email, scope: :user_type 
    validates_uniqueness_of :username, scope: :user_type 
    validates :username, presence: true, uniqueness: true
    validates :password, :password_confirmation, presence: true


  end
end
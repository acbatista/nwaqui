module Site
  class ExternalUser < ::User
    validates :email, email: true, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, :password_confirmation, presence: true
  end
end
module Admin
  class AdminUser < User 

    default_scope { where(user_type: 0)}
    
    validates :name, presence: true
    validates :email, email: true, presence: true
    validates :telephone, numericality: true, presence: true

    validates :username, uniqueness: true, presence: true, on: :create
    validates :password, :password_confirmation, presence: true, on: :create
    validate  :compare_password, on: :create

    private

    def compare_password
      if self.password != self.password_confirmation
        errors.add(:password, "As senhas não são iguais")
      end
    end

  end
end
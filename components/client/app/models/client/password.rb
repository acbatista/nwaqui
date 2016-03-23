module Client
  class Password
    include ActiveModel::Model
    
    attr_accessor :current_password, :id, :password, :password_confirmation

    validates :password, :password_confirmation, :current_password, presence: true

    validate :validate_passwords
    validate :validate_current_password

    def update_password
      @user = Client::Customer.find(self.id)
      @user.password = self.password
      @user.save
    end

    private

    def validate_passwords
      if self.password != self.password_confirmation
        errors.add(:password, "As senhas não são iguais")
      end
    end

    def validate_current_password
      @user = Client::Customer.find(self.id)
      
      if @user.password != self.current_password
        errors.add(:current_password, "Sua atual incorreta")
      end
    end
  end
end
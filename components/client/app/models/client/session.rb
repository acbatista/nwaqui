module Client
  class Session
    include ActiveModel::Model 

    attr_accessor :username, :password, :id

    validates :username, :password, presence: true
    validate :authenticate!

    private

    def authenticate!
      @user = Admin::CustomerUser.where(username: self.username, password: self.password).first

      if @user.present?
        self.id = @user.id 
      else
        errors.add(:username, "Usuário ou senha incorreto.")
      end
    end
  end
end
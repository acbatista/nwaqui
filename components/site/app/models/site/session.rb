module Site
  class Session
    include ActiveModel::Model 
    
    attr_accessor :email, :password, :id

    validates :email, :password, presence: true
    validate :authenticate!

    private

    def authenticate!
      @user = Site::ExternalUser.no_oauth.where(email: self.email, password_digest: self.password).first

      if @user.present?
        self.id = @user.id 
      else
        errors.add(:email, "Usuário ou senha incorreto.")
      end
    end
  end
end
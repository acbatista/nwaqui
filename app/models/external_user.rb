class ExternalUser < ActiveRecord::Base

  attr_accessor :password_confirmation
  
  scope :no_oauth, -> {where(uuid: nil, provider: nil)}

  validates :email, email: true
  validates :password_digest, :password_confirmation, presence: true, if: :omniauth?

  validate :unique_email?, if: :omniauth?
  validate :compare_password, if: :omniauth?

  def self.from_omniauth(auth)
    self.find_by_provider_and_uuid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uuid = auth["uid"]
      user.email = auth["info"]["email"]
    end
  end

  private

  def unique_email?
    if ExternalUser.no_oauth.where(email: self.email).present?
      errors.add(:email, "Este e-mail já está cadastrado")
    end
  end

  def omniauth?
    !self.uuid.present?
  end

  def compare_password
    errors.add(:password_digest, 'Senha não confere') unless self.password_digest == self.password_confirmation
  end

end

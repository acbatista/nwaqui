class ExternalUser < ActiveRecord::Base

  attr_accessor :password_confirmation
  
  validates :email, email: true, uniqueness: true
  validates :password_digest, :password_confirmation, presence: true

  validate :compare_password, if: :omniauth?

  def self.from_omniauth(auth)
    self.find_by_provider_and_uuid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uuid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  private

  def omniauth?
    !self.uuid.present?
  end

  def compare_password
    errors.add(:password_digest, 'Senha não confere') unless self.password_digest == self.password_confirmation
  end

end

class Message < ActiveRecord::Base
  belongs_to :customer

  validates :name, :email, :telephone, :content, presence: true
  validates :email, email: true
  validates :telephone, numericality: true

  scope :by_situation, -> (situation) { where(read: situation)}
end

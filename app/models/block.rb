class Block < ActiveRecord::Base
  belongs_to :group

  validates :name, :cep, presence: true

  validates :complete_address, presence: true
  validates_uniqueness_of :name, scope: :group
end

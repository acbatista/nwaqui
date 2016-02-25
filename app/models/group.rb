class Group < ActiveRecord::Base
  belongs_to :address
  has_many :blocks
    
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :address
end

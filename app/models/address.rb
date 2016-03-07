class Address < ActiveRecord::Base
  has_many :blocks
  has_many :groups
  
  validates :name, presence: true, uniqueness: true
  validates :region, presence: true
end

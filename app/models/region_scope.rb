class RegionScope < ActiveRecord::Base

  has_many :addresses
  has_many :buttons
  has_many :specials
  
  validates :name, :domain, presence: true
  validates :domain, uniqueness: true
end

class Special < ActiveRecord::Base
  belongs_to :property
  belongs_to :region_scope

  validates :order, numericality: true, presence: true
  validates :property, presence: true 
end

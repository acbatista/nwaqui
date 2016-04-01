class Special < ActiveRecord::Base
  belongs_to :property

  validates :order, numericality: true, presence: true
  validates :property, presence: true 
end

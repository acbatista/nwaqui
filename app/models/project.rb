class Project < ActiveRecord::Base
  belongs_to :customer

  validates :customer, :name, presence: true
end

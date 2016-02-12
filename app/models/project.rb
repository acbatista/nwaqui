class Project < ActiveRecord::Base
  belongs_to :customer

  scope :by_customer, -> customer_id { where(customer_id: customer_id)}
  scope :by_status,   -> (status = [true, false]) { where(status: status)}

  validates :customer, :name, presence: true
end

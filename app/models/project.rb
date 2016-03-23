class Project < ActiveRecord::Base
  belongs_to :customer

  scope :by_customer, -> customer_id { where(customer_id: customer_id)}
  scope :by_status,   -> (status = [true, false]) { where(status: status)}

  validates :image_path, file_size: { less_than_or_equal_to: 10.megabytes.to_i,
                                 message: "Arquivo não pode exceder 10 MB" }

  validates :image_path, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                         message: 'Somente arquivos .jpg ou .png' }
  validates :customer, :name, presence: true


  mount_uploader :image_path, ::ImageUploader 
end

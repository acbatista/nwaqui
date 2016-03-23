class Button < ActiveRecord::Base
  validates :name, :order, :link, :image, presence: true
  validates :order, numericality: true

  validates :image, file_size: { less_than_or_equal_to: 10.megabytes.to_i,
                                 message: "Arquivo não pode exceder 10 MB" }

  validates :image, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                         message: 'Somente arquivos .jpg ou .png' }

  mount_uploader :image, ::ImageUploader 
end

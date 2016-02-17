class Customer < ActiveRecord::Base
  
  has_many :projects
    
  validates :type_client, presence: true 

  validates :cep, :uf, :city, :address, :burgh, :fantasy_name, :responsible_name, presence: true
  validates :telephone, :responsible_telephone, numericality: true, presence: true
  validates :celphone, numericality: true, allow_blank: true
  validates :uf, length: {maximum: 2, minimum: 2}
  validates :contact_email, :cadastre_email, email: true, presence: true

  validates :cpf, cpf: true, presence: true, if: :is_cpf?
  validates :cnpj, cnpj: true, presence: true, if: :is_cnpj?
  validates :social_reason, presence: true, if: :is_cnpj?


  validates :logo_path, file_size: { less_than_or_equal_to: 10.megabytes.to_i,
                                 message: "Arquivo não pode exceder 10 MB" }

  validates :logo_path, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                         message: 'Somente arquivos .jpg ou .png' }

  mount_uploader :logo_path, ::ImageUploader 

  def label_name
    "#{self.id} - #{self.fantasy_name.downcase}"
  end


  private

  def is_cpf?
    self.pessoa_física?
  end

  def is_cnpj?
    self.pessoa_jurídica?
  end

  enum type_client: ['pessoa_física', 'pessoa_jurídica']
end


class Property < ActiveRecord::Base
  belongs_to :sellers, class_name: 'Customer'
  belongs_to :construction_companies, class_name: 'Customer'
  belongs_to :property_attributes, class_name: 'Attribute'
  
  belongs_to :customer
  belongs_to :project

  belongs_to :address
  belongs_to :group
  belongs_to :block

  has_many :images, class_name: "PropertyImage"
  
  scope :by_customer, -> customer {where(customer_id: customer)}
  scope :by_project, -> project {where(project_id: project)}
  
  scope :by_situation, -> situation {where(situation: situation)}
  scope :by_type,      -> commecial {where(type_property: commecial)}


  scope :attributes, -> {Attribute.all.order(:name) }


  enum situation: ['breve_lançamento', 'na_planta', 'em_construção', 'pronto']
  enum type_property: ['residencial', 'comercial']
  enum commercial_situation: ['lançamento', 'venda', 'aluguel']

  validates :description, :situation, :type_property, :status, :general_address, :general_group, presence: true
  validates :rooms, :suit, :parking_spaces, :floor, numericality: true, presence: true
  validates :city, :region, :group, :block, :address, :commercial_situation, presence: true
  
  def property_attributes; Attribute.where(id: self.property_attributes_id); end;

end

class Property < ActiveRecord::Base
  belongs_to :property_attributes, class_name: 'Attribute'
  
  belongs_to :customer
  belongs_to :project

  belongs_to :address
  belongs_to :group
  belongs_to :block

  has_many :images, class_name: "PropertyImage", dependent: :destroy
  
  scope :by_customer, -> customer {where(customer_id: customer)}
  
  scope :by_situation, -> situation {where(situation: situation)}
  scope :by_type,      -> commecial {where(type_property: commecial)}
  
  scope :by_block,      -> block {where(block_id: block)}
  scope :by_group,      -> group {where(group_id: group)}
  scope :by_client,     -> client {where(customer_id: client)}
  scope :by_commercial,  -> commercial {where(commercial_situation: commercial)}

  scope :attributes, -> {Attribute.all.order(:name) }


  enum situation: ['na_planta', 'em_construção','breve_lançamento','pronto']
  enum type_property: ['residencial', 'comercial']
  enum commercial_situation: ['lançamento', 'venda', 'aluguel']

  monetize :value, allow_nil: true
  monetize :value_rent, allow_nil: true

  validates :description, :situation, :type_property, :status, :general_address, :general_group, presence: true
  validates :rooms, :suit, :parking_spaces, :floor, numericality: true, presence: true
  validates :city, :region, :group, :block, :address, :commercial_situation, presence: true
  
  def property_attributes; Attribute.where(id: self.property_attributes_id); end;

  def companies; Customer.where(id: self.company_id); end;

  def address_name
    "#{self.group.name.upcase} Bloco #{self.block.name} 
     #{self.unit} - #{self.commercial_situation.humanize}"
  end
end

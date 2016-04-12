class Property < ActiveRecord::Base
  belongs_to :property_attributes, class_name: 'Attribute'
    
  belongs_to :customer

  belongs_to :address
  belongs_to :group
  belongs_to :block

  default_scope {order(:id)}

  has_many :images, class_name: "PropertyImage", dependent: :destroy
  
  scope :by_customer, -> customer {where(customer_id: customer)}
  
  scope :by_situation, -> situation {where(situation: situation)}
  scope :by_type,      -> commecial {where(type_property: commecial)}
  
  scope :by_group,        -> group {joins(:group).where("groups.name = ?", "%#{group.split('_')[1]} #{group.split('_')[0][0]}")}    
  scope :by_group_view,   -> group {where(group_id: group)}    
  scope :by_block,        -> block {where(block_id: block)}
  scope :by_area,         -> (area = nil)  {where(area: area.to_s.split('_')[0]..area.to_s.split('_')[1])}
  scope :by_client,       -> client {where(customer_id: client)}
  scope :by_commercial,   -> commercial {where(commercial_situation: commercial)}
  scope :by_detail_group, -> group { where(group_id: group)}
  scope :by_room,         -> room { where(rooms: room)}
  scope :by_order,        -> order { order(order)}
  
  scope :attributes, -> {Attribute.all.order(:name) }


  enum situation: ['na_planta', 'em_construção','breve_lançamento','pronto']
  enum type_property: ['residencial', 'comercial']
  enum commercial_situation: ['lançamento', 'venda', 'aluguel']

  monetize :value, allow_nil: true
  monetize :value_rent, allow_nil: true
  monetize :value_m2, allow_nil: true

  validates :situation, :type_property, :general_address, :general_group, presence: true
  validates :rooms, :suit, :parking_spaces, :floor, numericality: true, allow_blank: true
  validates :city, :region, :group, :block, :address, :commercial_situation, presence: true
  #validates :prediction, presence: true, if: :is_lançamento?
  
  def property_attributes; Attribute.where(id: self.property_attributes_id); end;

  def companies; Customer.where(id: self.company_id); end;

  def address_name
    "#{self.commercial_situation.humanize} - #{self.group.name.upcase} Bloco #{self.block.name} 
     #{self.unit} #{project_formated}"
  end

  def project_formated
    "- #{project}"
  end
  
  def unit_formated
    self.unit.present? ? " - Nº #{self.unit}" : ""
  end

  private

  def is_lançamento?
    self.lançamento? && !self.pronto?
  end
end

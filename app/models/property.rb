class Property < ActiveRecord::Base
  has_many :sellers, class_name: 'Customer'
  has_many :construction_companies, class_name: 'Customer'
  
  belongs_to :customer
  belongs_to :project

  enum situation: ['breve_lançamento', 
                   'na_planta',
                   'em_construção',
                   'pronto']

  enum type_property: ['lançamento', 'venda', 'aluguel']

  validates :name, :description, :situation, :type_property, :status, presence: true
  validates :customer, :project, presence: true
  validates :rooms, presence: true

end

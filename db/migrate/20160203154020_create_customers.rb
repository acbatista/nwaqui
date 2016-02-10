class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      
      t.string  :logo_path
      t.string  :social_reason
      t.string  :fantasy_name
      t.string  :cnpj
      t.string  :cpf
      t.integer :type_client, default: 0
      t.string  :address
      t.string  :cep
      t.string  :uf
      t.string  :city
      t.string  :contact_email
      t.string  :cadastre_email
      t.string  :telephone
      t.string  :celphone
      t.string  :responsible_telephone
      t.string  :responsible_name

      t.timestamps null: false
    end
    
  end
end

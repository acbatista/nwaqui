class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      
      t.string  :creci
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
      t.string  :creci
      
      t.string :username
      t.string :password
      t.string :token

      t.boolean :token_status, default: true
      
      t.date  :last_signed

      t.boolean :status, default: true

      t.timestamps null: false
    end
  
    add_index :customers, :username, unique: true
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name 
      t.string :bio 
      t.string :avatar

      t.string :username
      t.string :password
      
      t.string :email
      t.string :telephone
      
      t.string :token
      t.boolean :token_status, default: true
      
      t.date  :last_signed
      t.boolean :status, default: true

      t.integer :user_type, default: 0 #[admin: 0, customer: 1, simple_user: 2]
     
      t.references :customer, array: true, default: []
      
      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end

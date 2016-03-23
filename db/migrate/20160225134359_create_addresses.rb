class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :name 
      t.boolean :status, default: true
      t.string  :region
      
      t.timestamps null: false
    end
  end
end

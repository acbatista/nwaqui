class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.references :group, index: true 
      t.string :name 
      t.string :tour_360
      t.string :complete_address
      t.string :reference_point
      t.string :cep
      
      t.timestamps null: false
    end
  end
end

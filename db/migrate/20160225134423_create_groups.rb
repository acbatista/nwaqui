class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :address, index: true
      t.string :name
      t.string :tour_360
      
      t.timestamps null: false
    end
  end
end

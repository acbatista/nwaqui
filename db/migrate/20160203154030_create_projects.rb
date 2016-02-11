class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      
      t.references :customer, index: true

      t.string :image_path
      
      t.string :name 
      t.string :description
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end

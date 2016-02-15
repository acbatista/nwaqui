class CreatePropertyImages < ActiveRecord::Migration
  def change
    create_table :property_images do |t|
      t.references :property, index: true#, foreign_key: true
      t.string :image
      t.integer :order
      t.string :name
      t.boolean :publish

      t.timestamps null: false
    end
  end
end

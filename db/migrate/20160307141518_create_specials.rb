class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.references :property, index: true, foreign_key: true
      t.integer :order
      t.boolean :status

      t.timestamps null: false
    end
  end
end

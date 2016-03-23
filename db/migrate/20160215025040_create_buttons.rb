class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.integer :order
      t.string :image
      t.string :name
      t.boolean :publish
      t.string :link

      t.timestamps null: false
    end
  end
end

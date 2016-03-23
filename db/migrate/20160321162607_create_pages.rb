class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :code
      t.string :slug
      t.boolean :publish, default: true

      t.timestamps null: false
    end
    add_index :pages, :slug, unique: true 
  end
end

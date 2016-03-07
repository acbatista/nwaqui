class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :customer, index: true#, foreign_key: true
      t.string :email
      t.string :name
      t.text :content
      t.string :telephone
      t.string :celphone
      t.boolean :read

      t.timestamps null: false
    end
  end
end

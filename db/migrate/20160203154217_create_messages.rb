class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.references :client, index: true
      t.text       :content

      t.string     :name
      t.string     :email
      t.string     :telephone

      t.timestamps null: false
    end
  end
end

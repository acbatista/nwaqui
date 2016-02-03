class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|

      t.timestamps null: false
    end
  end
end

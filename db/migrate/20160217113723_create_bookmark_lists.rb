class CreateBookmarkLists < ActiveRecord::Migration
  def change
    create_table :bookmark_lists do |t|
      t.references :user, index: true#, foreign_key: true
      t.text :token

      t.timestamps null: false
    end
  end
end

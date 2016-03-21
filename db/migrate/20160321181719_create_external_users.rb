class CreateExternalUsers < ActiveRecord::Migration
  def change
    create_table :external_users do |t|
      t.string :name
      t.string :email
      t.string :photo
      t.string :uuid
      t.string :provider
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

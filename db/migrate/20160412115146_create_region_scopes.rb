class CreateRegionScopes < ActiveRecord::Migration
  def change
    create_table :region_scopes do |t|
      t.string :domain
      t.string :name

      t.timestamps null: false
    end
  end
end

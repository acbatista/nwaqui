class AddRegionScopeToButton < ActiveRecord::Migration
  def change
    add_reference :buttons, :region_scope, index: true#, foreign_key: true
  end
end

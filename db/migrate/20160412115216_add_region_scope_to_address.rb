class AddRegionScopeToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :region_scope, index: true#, foreign_key: true
  end
end

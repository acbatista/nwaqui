class AddRegionScopeToSpecial < ActiveRecord::Migration
  def change
    add_reference :specials, :region_scope, index: true#, foreign_key: true
  end
end

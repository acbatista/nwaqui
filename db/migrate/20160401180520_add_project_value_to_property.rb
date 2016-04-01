class AddProjectValueToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :project_value, :string
  end
end

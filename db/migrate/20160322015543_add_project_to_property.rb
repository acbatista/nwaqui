class AddProjectToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :project, :string
  end
end

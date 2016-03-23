class AddCompaniesToProperty < ActiveRecord::Migration
  def change
    add_reference :properties, :company, array: true, default: []
  end
end

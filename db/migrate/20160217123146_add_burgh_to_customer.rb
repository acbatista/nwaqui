class AddBurghToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :burgh, :string
  end
end

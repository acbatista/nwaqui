class AddTelephoneOptionalToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :telephone_optional, :string
  end
end

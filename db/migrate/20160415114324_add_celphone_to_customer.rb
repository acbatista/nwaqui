class AddCelphoneToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :responsible_celphone, :string
  end
end

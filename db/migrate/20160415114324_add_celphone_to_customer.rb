class AddCelphoneToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :responsible_celphone, :string
    add_column :customers, :contact_email_optional, :string
  end
end

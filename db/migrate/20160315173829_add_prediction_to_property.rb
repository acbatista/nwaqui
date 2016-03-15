class AddPredictionToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :prediction, :date
  end
end

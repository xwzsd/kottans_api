class AddColumnsToObservations < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :temp, :float
    add_column :observations, :humidity, :integer
    add_column :observations, :pressure, :integer
  end
end

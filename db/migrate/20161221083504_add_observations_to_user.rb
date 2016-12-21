class AddObservationsToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :user
  end
end

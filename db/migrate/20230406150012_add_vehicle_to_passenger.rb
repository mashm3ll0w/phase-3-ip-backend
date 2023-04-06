class AddVehicleToPassenger < ActiveRecord::Migration[6.1]
  def change
    add_column :passengers, :vehicle_id, :integer
  end
end

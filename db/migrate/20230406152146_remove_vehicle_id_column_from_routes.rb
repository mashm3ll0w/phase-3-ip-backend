class RemoveVehicleIdColumnFromRoutes < ActiveRecord::Migration[6.1]
  def change
    remove_column :routes, :vehicle_id
  end
end

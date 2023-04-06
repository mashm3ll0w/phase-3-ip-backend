class RenamePassengerIdToRouteId < ActiveRecord::Migration[6.1]
  def change
    rename_column :vehicles, :passenger_id, :route_id
  end
end

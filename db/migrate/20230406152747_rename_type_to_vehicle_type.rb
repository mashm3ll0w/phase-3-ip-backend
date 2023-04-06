class RenameTypeToVehicleType < ActiveRecord::Migration[6.1]
  def change
    rename_column :vehicles, :type, :vehicle_type
  end
end

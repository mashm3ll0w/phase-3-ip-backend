class RemoveTransitColumnFromVehicle < ActiveRecord::Migration[6.1]
  def change
    remove_column :vehicles, :in_transit
  end
end

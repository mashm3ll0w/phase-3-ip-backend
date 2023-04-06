class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :registration
      t.string :type
      t.integer :capacity
      t.boolean :in_transit
      t.integer :driver_id
      t.integer :passenger_id
    end
  end
end

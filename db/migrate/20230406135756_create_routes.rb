class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.integer :vehicle_id
      t.timestamps
    end
  end
end

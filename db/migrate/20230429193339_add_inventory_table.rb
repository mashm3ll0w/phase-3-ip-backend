class AddInventoryTable < ActiveRecord::Migration[6.1]
  def change
    create_table :caffe_items do |t|
      t.string :name
      t.string :type_
      t.integer :price
      t.string :size
      t.string :description
      t.string :poster_url
    end
  end
end

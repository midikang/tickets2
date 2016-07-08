class CreateShipmentLines < ActiveRecord::Migration
  def change
    create_table :shipment_lines do |t|
      t.integer :shipment_id
      t.integer :line_no
      t.string :item_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end

class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :customer_name

      t.timestamps null: false
    end
  end
end

class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :carrier_account
      t.string :freight_term
      t.integer :estimated_shipment_charge
      t.integer :actual_shipment_charge
      t.integer :freight_charge
      t.integer :shipment_id
      t.timestamps null: false
    end
  end
end

class Shipment < ActiveRecord::Base
  has_many  :shipmentLines
  accepts_nested_attributes_for :shipmentLines
end

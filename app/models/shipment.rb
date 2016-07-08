class Shipment < ActiveRecord::Base
  has_many  :shipmentLines, dependent: :destroy
  accepts_nested_attributes_for :shipmentLines
end

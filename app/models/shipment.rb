class Shipment < ActiveRecord::Base
  has_many  :shipmentLines, dependent: :destroy
  has_many  :charges, dependent: :destroy
  accepts_nested_attributes_for :shipmentLines, :charges
end

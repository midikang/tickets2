json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :customer_name
  json.url shipment_url(shipment, format: :json)
end

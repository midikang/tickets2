json.array!(@shipment_lines) do |shipment_line|
  json.extract! shipment_line, :id, :shipment_id, :line_no, :item_id, :quantity
  json.url shipment_line_url(shipment_line, format: :json)
end

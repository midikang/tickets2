json.array!(@addresses) do |address|
  json.extract! address, :id, :kind, :street
  json.url address_url(address, format: :json)
end

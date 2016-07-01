json.array!(@menu_items) do |menu_item|
  json.extract! menu_item, :id, :menu_id, :name, :url
  json.url menu_item_url(menu_item, format: :json)
end

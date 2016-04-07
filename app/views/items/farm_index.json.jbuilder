json.array!(@items) do |item|
  json.extract! item, :id, :name, :quantity, :price, :farm_id, :category_id, :description, :images
end
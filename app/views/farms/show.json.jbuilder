json.array!(@items) do |item|
  json.name item.name
  json.quantity item.quantity
  json.price item.price
  json.farm_id item.farm_id
  json.archived item.archived
  json.description item.description
  json.images item.images do |image|
    json.image image.image.url
  end
end


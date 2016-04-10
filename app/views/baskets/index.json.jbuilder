json.array!(@basket_items) do |basket_item|
  json.extract! basket_item, :id, :item_id, :restaurant_id, :quantity, :item
end
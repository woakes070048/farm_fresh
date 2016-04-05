json.array!(@categories) do |category|
  json.extract! category, :id, :name, :parent_id
end
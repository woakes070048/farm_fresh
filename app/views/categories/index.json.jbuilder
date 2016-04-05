json.array!(@categories) do |category|
  json.extract! category, :name, :parent_id
end
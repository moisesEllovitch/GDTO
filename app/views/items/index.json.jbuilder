json.array!(@items) do |item|
  json.extract! item, :id, :category, :institution, :average
  json.url item_url(item, format: :json)
end

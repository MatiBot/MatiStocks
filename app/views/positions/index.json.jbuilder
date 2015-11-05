json.array!(@positions) do |position|
  json.extract! position, :id, :symbol, :price, :number
  json.url position_url(position, format: :json)
end

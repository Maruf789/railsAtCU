json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :manufacturer, :model, :speed, :price
  json.url vehicle_url(vehicle, format: :json)
end

json.array!(@nearby_farms) do |farm|
  json.name farm.name
  json.address farm.full_address.gsub(",", "").gsub("  ", " ")
  json.distance farm.distance
  json.lat farm.latitude
  json.lng farm.longitude
  json.picture do
    json.url "https://s3-eu-west-1.amazonaws.com/kpfarmfresh/pin.png"
    json.width 32
    json.height 37
  end
  json.infowindow "#{farm.name.titleize}, #{farm.distance} miles away"
end

class MapsController < ApplicationController
  before_filter :authenticate_restaurant!

  def index
    @my_position = [current_restaurant.latitude, current_restaurant.longitude]

    @nearby_farms = Farm.geocoded.near(@my_position, 40).each do |farm|
      farm.distance = farm.distance_from(@my_position).round(2)
    end
  end
end

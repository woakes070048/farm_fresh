require 'rails_helper'

describe FavouriteFarm, type: :model do

  before do
    @restaurant = Restaurant.create(email:                  "1@rest.com",
                                     name:                  "Top Pastries",
                                     password:              "12345678",
                                     password_confirmation: "12345678")
    create_helper_objects
  end

  it "must have both a farm and a restaurant present" do
    fav_farm = FavouriteFarm.create
    expect(fav_farm).to_not be_valid

    fav_farm = FavouriteFarm.create(restaurant: @restaurant)
    expect(fav_farm).to_not be_valid

    fav_farm = FavouriteFarm.create(farm: @farm1)
    expect(fav_farm).to_not be_valid

    fav_farm = FavouriteFarm.create(restaurant: @restaurant, farm: @farm)
    expect(fav_farm).to be_valid
  end

  it "should be able to create from a restaurant user" do

    previous_count = FavouriteFarm.count
    fav_farm = @restaurant.favourite_farms.create(farm: @farm)

    expect(fav_farm).to be_valid
    expect(FavouriteFarm.count).to eq previous_count + 1
  end

  it "should be able to delete from a restaurant user" do
    previous_count = FavouriteFarm.count
    fav_farm = @restaurant.favourite_farms.create(farm: @farm)
    expect(@restaurant.favourite_farms.count).to eq previous_count + 1

    @restaurant.favourite_farms.destroy_all
    expect(@restaurant.favourite_farms.count).to eq 0
  end

  it "should not allow farms to create favourites" do
    expect{@farm1.favourite_farms}.to raise_error NoMethodError
  end

  after(:each) do
    FavouriteFarm.destroy_all
    User.destroy_all
  end


end

require 'rails_helper'

describe FavouriteFarm, type: :model do

  before do
    @restaurant1 = Restaurant.create(email:                 "1@1.com",
                                     name:                  "Top Pastries",
                                     password:              "12345678",
                                     password_confirmation: "12345678")

    @farm1 = Farm.create(email:                 "1@1.com",
                         name:                  "Bob's Wheat Farm",
                         password:              "12345678",
                         password_confirmation: "12345678")
  end

  it "must have both a farm and a restaurant present" do
    fav_farm = FavouriteFarm.create
    expect(fav_farm).to_not be_valid

    fav_farm = FavouriteFarm.create(restaurant: @restaurant1)
    expect(fav_farm).to_not be_valid

    fav_farm = FavouriteFarm.create(farm: @farm1)
    expect(fav_farm).to_not be_valid

    fav_farm = FavouriteFarm.create(restaurant: @restaurant1, farm: @farm1)
    expect(fav_farm).to be_valid
  end

  it "should be able to create from a restaurant user" do
    expect(FavouriteFarm.count).to eq 0
    fav_farm = @restaurant1.favourite_farms.create(farm: @farm1)

    expect(fav_farm).to be_valid
    expect(FavouriteFarm.count).to eq 1
  end

  it "should be able to delete from a restaurant user" do
    fav_farm = @restaurant1.favourite_farms.create(farm: @farm1)
    expect(@restaurant1.favourite_farms.count).to eq 1

    @restaurant1.favourite_farms.destroy_all
    expect(@restaurant1.favourite_farms.count).to eq 0
  end

  it "should not allow farms to create favourites" do
    expect{@farm1.favourite_farms}.to raise_error NoMethodError
  end

  after(:each) do
    FavouriteFarm.destroy_all
    User.destroy_all
  end


end

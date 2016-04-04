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
    @fav_farm1 = @restaurant1.favourite_farms.create
    expect(@fav_farm1).to_not be_valid
  end

  it "should be able to create from a restaurant user" do
    pending

  end

  it "should be able to delete from a restaurant user" do
    pending

  end

  it "should not allow creation from non restaurant users" do
    pending

  end

  after(:all) do
    FavouriteFarm.destroy_all
    User.destroy_all
  end


end

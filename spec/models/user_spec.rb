require 'rails_helper'

describe User do

  describe "Adding users" do

    before do
      @valid_user = User.new(email:                 "bob@1.com",
                             password:              "12345678",
                             password_confirmation: "12345678")

      @invalid_user1 = User.new(email:                 "bob@2.com",
                                password:              "1234",
                                password_confirmation: "1234")

      @invalid_user2 = User.new(email:                 "bob@3.com",
                                password:              "12345678",
                                password_confirmation: "123456789")
    end

    it "should create a user with email and password" do
      expect(User.count).to eq 0
      @valid_user.save
      expect(@valid_user).to be_valid
      expect(User.count).to eq 1
    end

    it "should not save users with password less than 8 characters" do
      expect(User.count).to eq 0
      @invalid_user1.save
      expect(@invalid_user1).to_not be_valid
      expect(User.count).to eq 0
    end

    it "should not save users where password and password\
       confirmation do not match" do
      expect(User.count).to eq 0
      @invalid_user2.save
      expect(@invalid_user2).to_not be_valid
    end

    after(:all) do
      User.destroy_all
    end

  end


  describe Restaurant do

    before do
      @restaurant1 = Restaurant.new(email:                 "1@1.com",
                                    password:              "12345678",
                                    password_confirmation: "12345678")

    end

    it "must have a name present" do
      expect(@restaurant1).to_not be_valid
      @restaurant1.name = "Top Pastries"
      expect(@restaurant1).to be_valid
    end

    it "should save type field as 'restaurant' \
        when I create a restaurant user" do
      expect(@restaurant1.type).to eq "Restaurant"
    end

  end

  describe Farm do
    before do
      @farm1 = Farm.new(email:                 "1@1.com",
                        password:              "12345678",
                        password_confirmation: "12345678")

    end

    it "must have a name present" do
      expect(@farm1).to_not be_valid
      @farm1.name = "Bob's Organic Farm"
      expect(@farm1).to be_valid
    end

    it "should save type field as 'Farm' \
        when I create a restaurant user" do
      expect(@farm1.type).to eq "Farm"
    end

  end

end
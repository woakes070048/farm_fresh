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
      previous_count = User.count
      @valid_user.save
      expect(@valid_user).to be_valid
      expect(User.count).to eq previous_count + 1
    end

    it "should not save users with password less than 8 characters" do
      previous_count = User.count
      @invalid_user1.save
      expect(@invalid_user1).to_not be_valid
      expect(User.count).to eq previous_count
    end

    it "should not save users where password and password\
       confirmation do not match" do
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

    it "should tweet a message" do
      @farm1.provider = "twitter"
      @farm1.access_token = "test"
      @farm1.access_secret = "test"
      expect_any_instance_of(Twitter::REST::Client).to receive(:update)
      expect(@farm1.tweet("Test message")).to be_nil
    end

    it "should create a user from omniauth" do
      auth = OmniAuth.config.mock_auth[:twitter]
      user = User
      expect(user).to receive(:where)
      expect(Proc.new{user.from_omniauth(auth)}).to raise_error
    end

  end


end
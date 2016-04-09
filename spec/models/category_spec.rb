require 'rails_helper'

describe Category, type: :model do

  before do
    @meat_category = Category.create(name: "Meat")
  end

  it "should have a name" do
    previous_count = Category.count

    invalid_category = Category.create
    expect(invalid_category).to_not be_valid
    expect(Category.count).to eq previous_count

    valid_category = Category.create(name: "Dairy")
    expect(valid_category).to be_valid
    expect(Category.count).to eq previous_count + 1
  end

  it "should be able to set a parent" do
    lamb_category = Category.create(name: "Lamb", parent: @meat_category)
    expect(lamb_category).to be_valid
  end

  it "should be able to get all it's children" do
    expect{@meat_category.children}.to_not raise_error
  end

  describe "accessing products from a category" do

    before do
      @farm = Farm.new(name:            "Pro Egg Farm",
                 email:                 "1@1.com",
                 password:              "12345678",
                 password_confirmation: "12345678")

      @chicken_category = Category.create(name: "Chicken", parent: @meat_category)

    end

    it "should be able to find items that belong to a category" do
      expect{@chicken_category.items}.to_not raise_error
    end

    it "should not be able to add product to a category with sub categories" do

      @chicken_category.items.create(name:     'Chicken',
                                     price:    1.42,
                                     quantity: 190,
                                     farm:     @farm)
    end

  end


end


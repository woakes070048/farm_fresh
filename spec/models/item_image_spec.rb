require 'rails_helper'

describe ItemImage, type: :model do

  before do
    @category = Category.create(name: "Eggs")

    @farm = Farm.create(name:                  "Pro Egg Farm",
                     email:                 "1@1.com",
                     password:              '12345678',
                     password_confirmation: "12345678")

    @valid_item = Item.create(name:     'Eggs',
                           price:    0.20,
                           quantity: 500,
                           category: @category,
                           farm:     @farm)
  end

  it "should have an image" do
    expect(ItemImage.new).to_not be_valid
    expect(ItemImage.new(item: @valid_item)).to_not be_valid

    new_image = ItemImage.create(item: @valid_item, image: "image.jpg")
    expect(new_image).to be_valid

    new_image = @valid_item.images.create(image: "image.png")
    expect(new_image).to be_valid
  end

  it "should have an item" do
    expect(ItemImage.new(image: "image.jpg")).to_not be_valid

    expect(@valid_item.images.new(image: "image.png")).to be_valid
  end



end

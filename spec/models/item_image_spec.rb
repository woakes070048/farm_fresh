require 'rails_helper'

describe ItemImage, type: :model do

  before do
    @category = Category.create(name: "Eggs")

    create_helper_objects

    @valid_item = Item.create(name:     'Eggs',
                           price:    0.20,
                           quantity: 500,
                           category: @category,
                           farm:     @farm)
  end

  it "should have an image" do
    expect(ItemImage.new).to_not be_valid
    expect(ItemImage.new(item: @valid_item)).to_not be_valid

    new_image = ItemImage.create(item: @valid_item,
      remote_image_url: "https://s3-eu-west-1.amazonaws.com/kpfarmfresh/test_item_image.jpg")
    expect(new_image).to be_valid

    new_image = @valid_item.images.create(
      remote_image_url: "https://s3-eu-west-1.amazonaws.com/kpfarmfresh/test_item_image.jpg")

    expect(new_image).to be_valid
  end

  it "should have an item" do
    expect(ItemImage.new(image: "image.jpg")).to_not be_valid
    expect(@valid_item.images.new(remote_image_url: "https://s3-eu-west-1.amazonaws.com/kpfarmfresh/test_item_image.jpg")).to be_valid
  end



end

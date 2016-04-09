require 'rails_helper'

describe BasketItem, type: :model do

  before do
    create_helper_objects
  end

  it "should only add a valid item to the basket" do
    expect(BasketItem.new).to_not be_valid

    basket_item = @restaurant1.basket_items.new
    expect(basket_item).to_not be_valid

    expect(@restaurant1.basket_items.new(item: @eggs, quantity: 20)).to be_valid
  end

  it "should delete an item" do
    basket_item = @restaurant1.basket_items.create(item: @eggs, quantity: 20)
    previous_count = @restaurant1.basket_items.count

    basket_item.destroy
    expect(@restaurant1.basket_items.count).to be previous_count - 1

  end
end

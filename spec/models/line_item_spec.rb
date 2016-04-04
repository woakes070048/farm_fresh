require 'rails_helper'

describe LineItem, type: :model do

  before do
    create_helper_objects
    @line_item1 = LineItem.new(order: @order, item: @eggs, quantity: 10)
  end

  it "should have an order" do
    @line_item1.item = nil
    expect(@line_item1).to_not be_valid

    @line_item1.item = @eggs
    expect(@line_item1).to be_valid
  end

  it "should have an item" do
    @line_item1.order = nil
    expect(@line_item1).to_not be_valid

    @line_item1.order = @order
    expect(@line_item1).to be_valid
  end

  it "should have a quantity greater than 0" do
    @line_item1.quantity = -10
    expect(@line_item1).to_not be_valid

    @line_item1.quantity = 20
    expect(@line_item1).to be_valid
  end
end

require 'rails_helper'

describe Category, type: :model do

  before do
    Category.destroy_all
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


end


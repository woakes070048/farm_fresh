require 'rails_helper'

describe Item, type: :model do
  before do
    @category = Category.create(name: "Eggs")
    @farm = Farm.new(name: "Pro Egg Farm")
    @valid_item = Item.new(name: 'Eggs', price: 0.20, quantity: 500
                           category: @category, farm: @farm)
  end

  describe "Adding an item" do

    it "should have a name" do
      invalid_item = @valid_item.dup
      invalid_item.name = nil
      expect(invalid_item).to_not be_valid

      expect(@valid_item).to be_valid
    end

    it "should have a price greater than 0" do
      invalid_item = @valid_item.dup
      invalid_item.price = -24.33
      expect(invalid_item).to_not be_valid

      expect(@valid_item).to be_valid
    end

    it "should belong to a category" do
      invalid_item = @valid_item.dup
      invalid_item.category = nil
      expect(invalid_item).to_not be_valid
    end

    it "should belong to a farm" do
      invalid_item = @valid_item.dup
      invalid_item.farm = nil
      expect(invalid_item).to_not be_valid

      expect(@valid_item).to be_valid
    end

  end

  describe "Deleting an item" do

    it "should not delete" do
      @valid_item.save
      previous_count = Item.count
      @valid_item.destroy
      expect(Item.count).to eq previous_count
    end

  end

  describe "Archiving an item" do

    before do
      Item.destroy_all
      @eggs = Item.new(name: 'Eggs', price: 0.20, quantity: 500
                           category: @category, farm: @farm)
      @bacon = Item.new(name: 'Bacon', price: 1.25, quantity: 120
                           category: @category, farm: @farm)
    end


    it "should not be archived by default" do
      expect(@eggs.archived).to be_nil
      @eggs.save
      expect(@eggs.archived).to be_false
    end

    it "should not appear in queries if archived" do
      # scope?
      @eggs.save
      @bacon.save
      expect(Item.live.count).to eq 2
      expect(Item.archived.coubt).to eq 0

      @eggs.update(archived: true)
      expect(Item.live.count).to eq 1
      expect(Item.archived.coubt).to eq 1
    end

  end

end

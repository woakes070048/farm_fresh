require 'rails_helper'

describe Item, type: :model do
  before do
    @category = Category.create(name: "Eggs")

    @farm = Farm.new(name:                  "Pro Egg Farm",
                     email:                 "1@1.com",
                     password:              '12345678',
                     password_confirmation: "12345678")

    @valid_item = Item.new(name:     'Eggs',
                           price:    0.20,
                           quantity: 500,
                           category: @category,
                           farm:     @farm)

  end

  describe "Adding an item" do

    before do
      @invalid_item = @valid_item.dup
    end

    it "should have a name" do
      @invalid_item.name = nil
      expect(@invalid_item).to_not be_valid

      expect(@valid_item).to be_valid
    end

    it "should have a price greater than 0" do
      @invalid_item.price = -24.33
      expect(@invalid_item).to_not be_valid

      expect(@valid_item).to be_valid
    end

    it "should belong to a category" do
      @invalid_item.category = nil
      expect(@invalid_item).to_not be_valid
    end

    it "should belong to a farm" do
      @invalid_item.farm = nil
      expect(@invalid_item).to_not be_valid

      expect(@valid_item).to be_valid
    end

  end

  describe "Deleting an item" do

    before do
      @cheese = Item.create(name:    'Medium Cheddar',
                            price:    2.79,
                            quantity: 26,
                            category: @category,
                            farm:     @farm)
    end

    it "should not delete" do
      previous_count = Item.count
      @cheese.destroy
      expect(Item.count).to eq previous_count
    end

  end

  describe "Archiving an item" do

    before do
      Item.destroy_all
      @eggs = Item.new(name:    'Eggs',
                       price:    0.20,
                       quantity: 500,
                       category: @category,
                       farm:     @farm)

      @bacon = Item.new(name:    'Bacon',
                        price:    1.25,
                        quantity: 120,
                        category: @category,
                        farm:     @farm)
    end


    it "should not be archived by default" do
      expect(@eggs.archived).to be_nil
      @eggs.save
      expect(@eggs.archived).to be false
    end

    it "should not appear in queries if archived" do
      previous_live_count = Item.live.count
      previous_archived_count = Item.archive.count
      @eggs.save
      @bacon.save
      expect(Item.live.count).to eq previous_live_count + 2
      expect(Item.archive.count).to eq previous_archived_count


      previous_live_count = Item.live.count
      previous_archived_count = Item.archive.count
      @eggs.update(archived: true)
      expect(Item.live.count).to eq previous_live_count - 1
      expect(Item.archive.count).to eq previous_archived_count + 1
    end

  end

end

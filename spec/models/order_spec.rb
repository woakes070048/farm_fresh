require 'rails_helper'

describe Order, type: :model do

  before do

    @category = Category.create(name: "Eggs")

    @farm = Farm.create(name:                  "Pro Egg Farm",
                     email:                 "1@1.com",
                     password:              '12345678',
                     password_confirmation: "12345678")

    @eggs = Item.create(name:    'Eggs',
                     price:    0.20,
                     quantity: 500,
                     category: @category,
                     farm:     @farm)

    @restaurant1 = Restaurant.create(email:                 "1@2.com",
                                     name:                  "Top Pastries",
                                     password:              "12345678",
                                     password_confirmation: "12345678")

    DeliveryOption.create(name: "1st Class", price: 2.99)

    @in_progress_status = Status.create(name: "In Progress")

    @order = Order.new(restaurant: @restaurant1,
                       delivery_option: DeliveryOption.first,
                       status: @in_progress_status)



    @line_item1 = @order.line_items.build(item: @eggs, quantity: 200)

  end

  describe "creating orders" do


    it "should belong to a restaurant" do
      @order.restaurant = nil
      expect(@order).to_not be_valid

      @order.restaurant = @restaurant1
      expect(@order).to be_valid
    end

    it "should have at least one line item" do
      @order.save
      expect(@order.line_items.count).to be > 0
    end

    it "should calculate its total price on every update" do
      @order.save
      expect(@order.total_ex_vat.to_i).to eq 40
    end

    it "should have a VAT percentage between 0 and 100%" do
      @order.save
      expect(@order.vat).to eq 20
    end

    it "should have a delivery option" do
      @order.delivery_option = nil
      expect(@order).to_not be_valid

      @order.delivery_option = DeliveryOption.first
      expect(@order).to be_valid
    end

    it "should have a default status of 'In Progress'" do
      @order.save
      expect(@order.status).to eq @in_progress_status
    end

    it "should have a status" do
      @order.status = nil
      expect(@order).to_not be_valid

      @order.status = @in_progress_status
      expect(@order).to be_valid
    end


  end

  describe "deleting orders" do

    before do
      @dispatched = Status.create(name: "Dispatched")
    end

    it "should not delete an order that has been processed" do
      @order.status = @dispatched
      @order.save
      previous_count = Order.count
      puts "before: #{Order.count}"

      @order.destroy
      binding.pry
      expect(Order.count).to eq previous_count

    end

    it "should be able to delete an order that has not been dispatched" do
      @order.status = @in_progress_status
      @order.save
      previous_count = Order.count

      @order.destroy
      expect(Order.count).to eq previous_count - 1
    end

  end

end

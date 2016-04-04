require 'rails_helper'

describe Order, type: :model do

  before do
    create_helper_objects
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

      @order.destroy
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

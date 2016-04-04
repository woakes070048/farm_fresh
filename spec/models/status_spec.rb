require 'rails_helper'

describe Status, type: :model do

  it "should have a name" do
    status = Status.new
    expect(status).to_not be_valid

    status.name = "In Progress"
    expect(status).to be_valid
  end

  it "should have a unique name" do
    status1 = Status.create(name: "In Progress")
    status2 = Status.new(name: "In Progress")
    expect(status2).to_not be_valid

    status2.name = "Dispatched"
    expect(status2).to be_valid
  end

  describe "fetching orders" do

    before do
      create_helper_objects
    end

    it "should get a list of orders for a status" do
      @order.status = @in_progress_status
      @order.save
      expect(@in_progress_status.orders.count).to eq 1
    end

  end

end

require 'rails_helper'

describe DeliveryOption, type: :model do

  before do
    DeliveryOption.create(name: "Royal Mail 1st Class", price: 4.99)
  end

  it "should have a unique name" do
    new_delivery_option = DeliveryOption.create(name: "Royal Mail 1st Class",
                                                price: 4.99)
    expect(new_delivery_option).to_not be_valid

    new_delivery_option = DeliveryOption.create(name: "Royal Mail 2nd Class",
                                                price: 2.99)
    expect(new_delivery_option).to be_valid
  end

  it "should have a price greater than or equal to 0" do
    new_delivery_option = DeliveryOption.create(name: "UPS1")
    expect(new_delivery_option).to_not be_valid

    new_delivery_option = DeliveryOption.create(name: "UPS2", price: -4.99)
    expect(new_delivery_option).to_not be_valid

    new_delivery_option = DeliveryOption.create(name: "UPS3", price: 4.99)
    expect(new_delivery_option).to be_valid
  end

end

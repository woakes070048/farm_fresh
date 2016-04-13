require 'rails_helper'

describe Farm, type: :model do

  describe "getting order stats" do

    before do
      create_helper_objects
      create_multiple_orders
      @farm = Farm.find_by(email: "1@1.com")
    end

    it "should be able to retrieve all line items that belong to me" do
      expect(@farm.line_items).to be_kind_of ActiveRecord::Associations::CollectionProxy
      expect(@farm.line_items.count).to be >= 0
    end

    it "should be able to retrieve all line_items that belong to me by status" do
      unshipped_status = Status.find_by(name: "Unshipped")
      my_unshipped_orders = @farm.line_items.where(status: unshipped_status)
      expect(my_unshipped_orders).to be_kind_of ActiveRecord::AssociationRelation
      expect(my_unshipped_orders.count).to be >= 0
    end

    it "should return a list of of items that were ordered from me in the last 7 days" do
      unshipped_status = Status.find_by(name: "Unshipped")
      my_new_orders = @farm.line_items.where(status: unshipped_status).recents
      expect(my_new_orders).to be_kind_of ActiveRecord::AssociationRelation
      expect(my_new_orders.count).to be >= 0
    end

    it "should return a hash of where my sales from from" do
      sales = @farm.sales_percentages
      expect(sales).to be_kind_of Hash
      expect(sales.keys).to include @farm.line_items.first.item.name
      expect(sales.values).to all(be_kind_of Float)
      expect(sales.values).to all(be >= 0)
    end

  end

end
require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before do
    create_helper_objects
    allow(controller).to receive(:current_restaurant).and_return(@restaurant1)
    @restaurant1.basket_items.create(item: @eggs, quantity: 200)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do

    it "should create a new order" do
      previous_count = Order.count
      post :create, {stripeToken: "test_token"}
      expect(Order.count).to be previous_count + 1
      expect(@restaurant1.basket_items.count).to be 0
    end
  end

end

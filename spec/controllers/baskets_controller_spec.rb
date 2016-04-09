require 'rails_helper'

describe BasketsController, type: :controller do
  render_views

  before do
    create_helper_objects
    allow(controller).to receive(:authenticate_restaurant!).and_return(true)
    allow(controller).to receive(:current_restaurant).and_return(@restaurant1)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it "should add a new basket item to the current_restaurant's basket" do
      test_data = BasketItem.new(item: @eggs, quantity: 10)
      previous_count = BasketItem.count

      post :create, {format: :json, basket_item: test_data.to_json}
      response_data = JSON.parse(response.body)

      expect(BasketItem.count).to eq previous_count + 1
      expect(response_data).to have_key "item_id"
      expect(response_data).to have_key "quantity"
      expect(response_data).to have_value 10
    end
  end

  describe "DELETE #destroy" do

    it "should delete a basket item with a valid id and return it" do
      basket_item = @restaurant1.basket_items.create(item: @eggs, quantity: 10)
      previous_count = BasketItem.count

      delete :destroy, {id: basket_item.id}
      response_data = JSON.parse(response.body)

      expect(response_data).to have_key "id"
      expect(response_data).to have_value basket_item.id
    end
  end
end

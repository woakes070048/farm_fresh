require 'rails_helper'

describe ItemsController, type: :controller do

  before do
    create_helper_objects
    sleep(0.5)
  end

  describe "As a restaurant" do
    render_views

    before do
      allow(controller).to receive(:authenticate_restaurant!).and_return(true)
      allow(controller).to receive(:current_restaurant).and_return(@restaurant1)
    end

    it "should get a page of items" do
      sign_in @restaurant1
      get :index, {format: JSON}
      expect(response.header['Content-Type']).to start_with 'application/json'
      expect(JSON.parse(response.body).map { |i| i["name"] }).to include "Eggs"

    end

    it "should get a page of items and in order of quantity if a sort option is provided" do
      sign_in @restaurant1
      get :index, {format: JSON, sort_option: "Quantity"}
      data = JSON.parse(response.body)
      expect(data.first["quantity"]).to be >= data.last["quantity"]
      expect(data.count).to be <= 10
    end

    it "should return items from a specific category" do
      sign_in @restaurant1
      get :index, {format: JSON, category_id: @category.id}
      data = JSON.parse(response.body)
      expect(data.count).to be <= 10

      data.each do |item|
        expect(item["category_id"]).to eq @category.id
      end
    end

    it "should return a specific item" do
      sign_in @restaurant1
      id = Item.first.id
      get :show, {format: :json, id: id}
      item = JSON.parse(response.body)
      expect(item["name"]).to eq "Eggs"
      expect(item["price"].to_f).to eq 0.20
      expect(item["quantity"]).to eq 500
    end
  end

  describe "As a farm" do
    render_views

    before do
      allow(controller).to receive(:authenticate_farm!).and_return(true)
      allow(controller).to receive(:current_farm).and_return(@farm)
    end

    it "should allow me to see my items" do
      sign_in @farm
      get :farm_index
      expect(response).to have_http_status(:success)
      expect(response.body).to have_content "My Items"
    end

    it "should allow a farm to create an item with valid data" do
      sign_in @farm
      get :show, { format: :json, id: Item.first.id}
      item_data = JSON.parse(response.body)
      item_data["id"] = nil
      item_data["farm_id"] = Farm.first
      previous_count = Item.count
      item = { item: item_data}

      post :create, item
      expect(Item.count).to eq previous_count + 1

      previous_count = Item.count
      item_data["farm_id"] = nil
      item_data["category_id"] = nil
      post :create, item
      expect(Item.count).to eq previous_count
    end


    it "should allow a farm to archive an item" do
      sign_in @farm
      previous_live_count = Item.live.count
      delete :destroy, {id: Item.last.id}
      expect(Item.live.count).to eq(previous_live_count - 1)
    end

    it "should show me the new form when creating a new item" do
      sign_in @farm
      get :new
      expect(response).to have_http_status(:success)
      expect(response.body).to have_content "Add a New Item"
    end

  end

end

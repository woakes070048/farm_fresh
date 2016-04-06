require 'rails_helper'

describe ItemsController, type: :controller do
  render_views

  before do
    create_helper_objects
  end

  it "should get a page of items" do
    sign_in @restaurant1
    get :index, {format: JSON}
    expect(response.header['Content-Type']).to start_with 'application/json'
    expect(JSON.parse(response.body).map { |i| i["name"] }).to include "Eggs"
  end

  it "should get a page of items if a sort option is provided" do
    sign_in @restaurant1
    get :index, {format: JSON}
    data = JSON.parse(response.body)
    expect(data.count).to be <= 10
  end

  it "should retrun a specific item" do
    sign_in @restaurant1
    id = Item.first.id
    get :show, {format: JSON}, {id: id}
    item = JSON.parse(response.body)
    expect(item.name).to eq "Eggs"
    expect(item.price).to eq 0.20
    expect(item.quantity).to eq 500
  end

  it "should allow a farm to create an item" do
    sign_in @restaurant1
    get :show, {format: JSON}, {id: Item.first.id}
    item = JSON.parse(response.body)

    previous_count = Item.count

    headers = { 'CONTENT_TYPE' => 'application/json' }
    json = item.to_json
    post :create, json, headers

    expect(Item.count).to eq previous_count + 1
  end

  it "should allow a farm to delete an item" do
    previous_count = Item.count
    delete :destroy, {format: JSON}, {id: Item.last.id}
    expect(Item.count).to eq previous_count - 1
  end


end

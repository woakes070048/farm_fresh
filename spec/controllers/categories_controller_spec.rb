require 'rails_helper'

describe CategoriesController, type: :controller do
  render_views

  before do
    # Restaurant.destroy_all
    # @user = Restaurant.create(name:                  "Top Pastries",
    #                           email:                 "top@1.com",
    #                           password:              "12345678",
    #                           password_confirmation: "12345678")
    create_helper_objects
  end

  it "should only allow restaurant users to access it" do
    get :index
    expect(response).to have_http_status(:redirect)

    sign_in @user
    get :index
    expect(response).to have_http_status(:success)
  end

  it "should return top level categories as json, when no parent_id present" do
    sign_in @user
    get :index, {format: 'json'}
    expect(response.header['Content-Type']).to start_with 'application/json'
    expect(JSON.parse(response.body).map { |i| i["name"] }).to include "Bakery"
  end

  it "should return child categories when parent_id present" do
    sign_in @user
    get :index, {format: 'json', parent_id: Category.top_level.first.id}
    expect(response.header['Content-Type']).to start_with 'application/json'
    expect(JSON.parse(response.body).map { |i| i["name"] }).to include "Bread"
  end

end
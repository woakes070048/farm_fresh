require 'rails_helper'

describe FarmsController, type: :controller do
  render_views

  before do
    create_helper_objects
    @farm = Farm.find_by(email: "1@1.com")
  end

  it "should return a list of items for a specified farm" do

    get :show, {format: :json, id: @farm.id}
    data = JSON.parse(response.body)

    expect(data.first).to have_key "name"
    expect(data.first).to have_key "price"
    expect(data.first).to have_key "quantity"

  end

end

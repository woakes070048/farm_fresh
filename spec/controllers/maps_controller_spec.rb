require 'rails_helper'

RSpec.describe MapsController, type: :controller do
  render_views

  before do
    create_helper_objects

    allow(controller).to receive(:authenticate_restaurant!).and_return(true)
    allow(controller).to receive(:current_restaurant).and_return(@restaurant1)
  end

  describe "index" do
    it "should return http success on a html request" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should return json data on a json request" do
      get :index, {format: :json}
      data = JSON.parse(response.body)
      expect(data.first).to have_key "name"
      expect(data.first).to have_key "address"
      expect(data.first).to have_key "lat"
      expect(data.first).to have_key "lng"
      expect(data.first).to have_key "picture"
    end
  end

end

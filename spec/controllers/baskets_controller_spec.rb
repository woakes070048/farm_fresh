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

  describe "GET #create" do

    it "should add a new basket item to the current_restaurant's basket" do

    end
  end
end

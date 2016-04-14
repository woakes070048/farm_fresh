require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  describe "new" do
    before do
      create_helper_objects
      create_multiple_orders
      allow(controller).to receive(:authenticate_restaurant!).and_return(true)
      allow(controller).to receive(:current_restaurant).and_return(@restaurant1)
    end

    it "should generate the correct values based on the basket" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should redirect on an invalid charge" do
      post :create, { stripeEmail: "test@test.com", stripToken: "123456"}
      expect(response).to have_http_status(:redirect)
    end
  end

end

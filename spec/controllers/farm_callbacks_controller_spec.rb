require 'rails_helper'

describe FarmCallbacksController, type: :controller do
  let(:farm_callbacks_controller) { FarmCallbacksController.new }

  describe "twitter" do
    it "should sign in a twitter user" do
      # get "/auth/twitter/callback"
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
      # expect(response).to be_success
    end

  end

end
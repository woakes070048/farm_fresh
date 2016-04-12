class FarmCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    @farm = Farm.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @farm
  end

end
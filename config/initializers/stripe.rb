Rails.configuration.stripe = {
  :publishable_key => ENV['stripe_access_key'],
  :secret_key      => ENV['stripe_secret_access_key']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
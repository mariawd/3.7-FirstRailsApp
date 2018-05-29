if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_E2toWP1KCjAfHtRcfKfNRlni',
    secret_key: 'sk_test_Jd3FXYdXeSQlHroxZ6r8FNZk'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

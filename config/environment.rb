# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: "http://localhost:3000" }
  config.action_mailer.smtp_settings = config_for(:email).symbolize_keys
end
# Load the Rails application.
require_relative "application"

env_port = (Rails.env == "development" ? 587 : 465)

ActionMailer::Base.smtp_settings = {
    port:env_port,
    address: 'smtp.gmail.com',
    user_name: 'syuna648@gmail.com',
    password: Base64.decode64("U2hpbll1bmEwOTkw\n"),
    authentication: :plain,
    enable_starttls_auto: true,
    domain:'gmail.com',
    openssl_verify_mode: 'none'
  }

# Initialize the Rails application.
Rails.application.initialize!

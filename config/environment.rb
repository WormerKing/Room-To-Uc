# Load the Rails application.
require_relative "application"

ActionMailer::Base.smtp_settings = {
    port: 587,
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

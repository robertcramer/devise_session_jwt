# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# setup action mailer
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'devise_session_and_jwt.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

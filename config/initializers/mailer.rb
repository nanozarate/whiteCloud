ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => 25,
  #:domain => 'banioserver@gmail.com',
  :user_name => 'banioserver@gmail.com',
  :password => 'bocserver123',
  :authentication => 'plain'
}
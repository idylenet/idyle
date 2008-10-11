# Email settings
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.idyle.net",
  :port => 25,
  :domain => "idyle.net",
  :authentication => :login,
  :user_name => "donotreply@idyle.net",
  :password => "nullified"
}


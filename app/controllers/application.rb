# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  def render(*args)
    	args.first[:layout] = false if request.xhr? and args.first[:layout].nil?
  	super
  end
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'eea2b1adb5a034b5f26b9ae89e5e4879'
end

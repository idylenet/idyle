# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
# require "authenticated_system.rb"

class ApplicationController < ActionController::Base

  # include SimpleCaptcha::ControllerHelpers 
  
  helper :all # include all helpers, all the time

  layout proc{ |c| c.request.xhr? ? false : "application" }


end

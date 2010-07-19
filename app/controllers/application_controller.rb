# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :authenticate

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private
  def authenticate
    puts "In authenticate method"

    if !Context.session_open then
      puts "no session"
      Context.open_session
      puts "session opened"
    end

    authenticate_or_request_with_http_basic do |user_name, password|
      if !Context.authenticated then
        puts "username is #{user_name}"
        puts "not authenticated"

	Context.authenticate(user_name, password)
	puts "authenticated as #{Context.authenticatedUser.username}" if Context.authenticated
	session[:logged_in_as] = Context.authenticatedUser.userId if Context.authenticated
        # need to put this somewhere: Context.userContext 
      end
    end
  end
  
  class Helper
    include Singleton
    include ApplicationHelper
  end
  
  def helpers
    Helper.instance 
  end

end

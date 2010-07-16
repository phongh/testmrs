# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_testapp_session',
  :secret      => '3b6aec5791745169533c97006a13f04647cc80eb00e3812be9f7b9ed17bde5c1dff81054b838046d13284dd408b48aca1674e03719559308214d2965f958ec2c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# This doesn't seem to do anything
if defined?($servlet_context)
  require 'action_controller/session/java_servlet_store'
  ActionController::Base.session_store = :java_servlet_store
end
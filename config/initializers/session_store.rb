# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pm_session',
  :secret      => '830b4e12428c29c6c3e646b0341136680e23b5dc7600c95bc40e33f128f7988d8ee731feaa0e4b0a7122315bb7d73da749ff479087ee7abf7dab57de9f03b5b9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

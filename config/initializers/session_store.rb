# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_login_session',
  :secret      => '93a57d42623b8ea7d8d91e661759f6fef8e0dc8240eb4f9ae51b05a8414115fe11ee1909c819e45b01a4e8db330ea1f853533fb02e49ad085adb0e6c21f1c9d0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

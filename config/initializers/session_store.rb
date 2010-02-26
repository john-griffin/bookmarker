# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bookmarker_session',
  :secret      => '27a6cdc075a363057a2d4856dca4dc3da61d14ec4c8642953942380956d3963f62769bb5db8b7c77f25a2279d4c865be00ba4c003daab65cf7d5cc95b7764d3b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_seek_your_course_session',
  :secret      => '5a8e5070df934c814d1dce5a34e6480a6ea4cef89031dedc6ffeb655de58b1fc172abd883e7225c871b033e13b8575ccc37f5cc07fda71056fd896fc81a17cf2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

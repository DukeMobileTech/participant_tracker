# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
ParticipantTracking::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test? 
  '147687ec524fe3c6491e37e8492b642b01bf42d0cb0a20cc9dfbb46993308601317ff5ea086b7ed510d7477fd26e90de5ddc85aed229ff6af779cad81ee1dd4c'
else 
  ENV['SECRET_TOKEN'] || File.read(File.join(Rails.root, 'config', 'secret_token.txt'))
end

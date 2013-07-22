# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# SampleApp::Application.config.secret_key_base = '74f44378b608eaf0a1819c8a045c09c5e8ee086bb9b721794f6dd4d1bb74e20f509d13678e0b27d39198962301129442be1f3e5770d6ef055262f86c2e402834'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #use the existing token
    File.read(token_file).chomp
  else
    #generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = 'a271d9dd1f54bf9751509c43007c5753109050d9edadacd3c249bfe6f8789586b3056bad245fac0325c321a72272eed88e40912723770d7eb365d4907deb8b42'

def secure_token
  token_file = Rails.root.join('.secret')
  
  #Use an existing token found in .secret file.
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    # if file doesn't exist then generate a new token and create the .secret file.
    token = SecureRandom.hex(64)
    File.write(token_file,token)
    return token
  end
end

SampleApp::Application.config.secret_key_base = secure_token    

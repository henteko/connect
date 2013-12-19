# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Connect::Application.config.secret_key_base = '35bc8dbb4dd387dc3d0383fdbd726fa84560c79b7602fc93f12de28d7b11c9b369868a1a33de5a4ad09375c66ce40bc5d42a46707ff8d770dce814970c212494'

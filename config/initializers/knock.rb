require "knock/authtoken"

Knock.setup do |config|
  # if Rails.env.test?
  #   p ENV["SECRET_KEY_BASE"]
  #   config.token_secret_signature_key = -> { ENV["SECRET_KEY_BASE"] }
  # else
  config.token_lifetime = 1.day
  config.token_audience = -> { ENV["AUTH0_AUDIENCE"] }

  # Auth0 uses RS256.
  config.token_signature_algorithm = "RS256"

  # API secret from Auth0.
  config.token_secret_signature_key = -> { ENV["AUTH0_CLIENT_SECRET"] }

  # RS256 is an asymmetric algorithm, which means it requires a private and public key.
  jwks_raw = HTTP.get(ENV["AUTH0_RSA_DOMAIN"]).body.to_s
  jwks_keys = Array(JSON.parse(jwks_raw)["keys"])
  config.token_public_key = OpenSSL::X509::Certificate.new(Base64.decode64(jwks_keys[0]["x5c"].first)).public_key
end
# end

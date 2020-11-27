class Auth0Service
  class << self
    def signup(email, password)
      HTTP.headers(accept: "application/json")
          .post(
            "https://#{ENV['AUTH0_DOMAIN']}/dbconnections/signup",
            form: {
              client_id: ENV["AUTH0_CLIENT_ID"],
              email: email,
              password: password,
              connection: "Username-Password-Authentication"
            }
          )
    end

    def signin(email, password)
      ctx = OpenSSL::SSL::SSLContext.new
      ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE

      HTTP.headers(accept: "application/json")
          .post(
            "https://#{ENV['AUTH0_DOMAIN']}/oauth/token",
            ssl_context: ctx,
            json: signin_object(email, password)
          )
    end

    def signin_object(email, password)
      {
        grant_type: "password",
        username: email,
        password: password,
        scope: "openid",
        audience: ENV["AUTH0_AUDIENCE"],
        client_id: ENV["AUTH0_CLIENT_ID"],
        client_secret: ENV["AUTH0_CLIENT_SECRET"]
      }
    end
  end
end

class UsersController < ApplicationController
  def signup
    response = Auth0Service.signup(params[:email], params[:password])
    response_body = JSON.parse(response.body)
    if response.status == 200
      profile = User.create(auth0_uid: "auth0|#{response_body["_id"]}")
      render json: response_body, status: :ok
    else
      render json: response_body, status: :bad_request
    end
  end

  def access_token
    response = Auth0Service.signin(params[:email], params[:password])
    response_body = JSON.parse(response.body)
    render json: { access_token: response_body["access_token"] }, status: :ok
  end
end

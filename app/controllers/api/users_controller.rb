class Api::UsersController < ApplicationController
  def create
    response = Auth0Service.signup(params[:email], params[:password])
    response_body = JSON.parse(response.body)
    if response.status == 200
      profile = User.create(auth0_uid: "auth0|#{response_body['_id']}")
      render json: profile, status: :ok
    else
      render json: response_body, status: :bad_request
    end
  end

  def access_token
    response = Auth0Service.signin(params[:email], params[:password])
    response_body = JSON.parse(response.body)
    render json: { access_token: response_body["access_token"] }, status: :ok
  end

  def update_subscription
    current_user.subscription_type = params[:subscription_type]
    if current_user.save
      render json: current_user, status: :ok
    else
      render json: current_user.errors, status: :bad_request
    end
  end
end

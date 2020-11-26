class ApplicationController < ActionController::API
  private

  def authorize_request
    AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ["Not Authenticated"] }, status: :unauthorized
  end
end

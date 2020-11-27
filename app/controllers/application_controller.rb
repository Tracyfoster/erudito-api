class ApplicationController < ActionController::API
  include Knock::Authenticable

  private

  # Define unauthorized access json response
  def unauthorized_entity(_entity_name)
    render json: { error: "Unauthorized request" }, status: :unauthorized
  end
end

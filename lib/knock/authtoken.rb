# Find our User by id in test environment, and auth0_uid in other environments.
Knock::AuthToken.class_eval do
  def entity_for(entity_class)
    key_to_find = Rails.env.test? ? :id : :auth0_uid
    entity_class.find_by(key_to_find => @payload['sub'])
  end
end

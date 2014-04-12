OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1428635940721695', '0ee2514d630e0b3a1cdb8b1c2af9633a', scope: "email,publish_stream"
end
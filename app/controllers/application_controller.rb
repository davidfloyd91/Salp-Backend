class ApplicationController < ActionController::API
  def encode_token
    JWT.encode(payload, Rails.application.credentials.auth_secret)
  end
end

class ApplicationController < ActionController::API
  def auth_headers
    request.headers['Authorization']
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.auth_secret)
  end

  def decode_token
    begin
      JWT.decode(auth_headers, Rails.application.credentials.auth_secret)
    rescue
      nil
    end
  end

  def current_user
    puts 'in current_user'
    User.find(decode_token[0]['user_id'])
  end

  def authorize
    unless current_user
      render json: { errors: 'Sorry, you\'re not logged in' }
    end
  end
end

class ApplicationController < ActionController::API
  def auth_headers
    request.headers['Authorization']
  end

  def encode_token(payload)
    # JWT.encode(payload, 'unsafe_secret_replacement')
    JWT.encode(payload, ENV['AUTH_SECRET'])
  end

  def decode_token
    begin
      # JWT.decode(auth_headers, 'unsafe_secret_replacement')
      JWT.decode(auth_headers, ENV['AUTH_SECRET'])
    rescue
      nil
    end
  end

  def current_user
    User.find(decode_token[0]['user_id'])
  end

  def authorize
    unless current_user
      render json: { errors: 'Sorry, you\'re not logged in' }
    end
  end
end

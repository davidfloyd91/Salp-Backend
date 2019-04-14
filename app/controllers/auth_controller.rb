class AuthController < ApplicationController
  def login
    user = User.find_by(username: params[:usermname])
    if user && user.authenticate(params[:password])
      jwt = encode_token({user_id: user.id})
      render json: {user: user, jwt: jwt}
    else
      render json: {errors: 'Sorry, we didn\'t recognize that username and password'}
    end
  end
end

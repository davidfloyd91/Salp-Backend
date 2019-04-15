class AuthController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      jwt = encode_token({user_id: @user.id})
      render json: {user: @user, jwt: jwt}
    else
      render json: {errors: 'Sorry, we didn\'t recognize that username and password'}
    end
  end

  def auto_login
    if current_user
      render json: current_user
    else
      render json: { errors: 'Sorry, you\'re not logged in' }
    end
  end
end

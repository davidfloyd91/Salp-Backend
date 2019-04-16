class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, except: :password_digest
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: :charts, except: :password_digest
  end

  def create
    @user = User.new(user_params)
    if @user.save
      jwt = encode_token({user_id: @user.id})
      render json: {user: @user, jwt: jwt}
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end

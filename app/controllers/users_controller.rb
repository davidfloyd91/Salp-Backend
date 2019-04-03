class UsersController < ApplicationController
  # if something's broken it's probably your params vvv

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: :charts
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end

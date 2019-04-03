class ChartsController < ApplicationController
  def index
    @charts = Chart.all
    render json: @charts
  end

  def show
    @chart = Chart.find(params[:id])
    render json: @chart
  end

  private

  def chart_params
    params.permit(:user_id, :data)
  end
end

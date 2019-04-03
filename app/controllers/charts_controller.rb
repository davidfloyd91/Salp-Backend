class ChartsController < ApplicationController
  # if something's broken it's probably your params vvv

  def index
    @charts = Chart.all
    render json: @charts
  end

  def show
    @chart = Chart.find(params[:id])
    render json: @chart
  end

  def create
    @chart = Chart.new(params[:chart])

    if @chart.save
      render json: @chart
    end
  end
end

class ChartsController < ApplicationController
  def index
    @charts = Chart.all
    render json: @charts
  end

  def show
    @chart = Chart.find(params[:id])
    render json: @chart
  end

  def create
    @chart = Chart.new(chart_params)

    if @chart.save
      render json: @chart
    end
  end

  private

  def chart_params
    params.require(:chart).permit!
  end
end

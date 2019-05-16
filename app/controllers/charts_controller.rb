class ChartsController < ApplicationController
  # before_action :authorize

  def root
    render json: {hello: 'world'}
  end

  def index
    @charts = Chart.all
    render json: @charts
  end

  def show
    @chart = Chart.find(params[:id])
    render json: @chart
  end

  def update
    @chart = Chart.find(params[:id])
    @chart.update(data: params[:data])
    render json: @chart
  end

  def create
    @chart = Chart.new(chart_params)

    if @chart.save
      render json: @chart, status: :ok
    end
  end

  def destroy
    @chart = Chart.find(params[:id])
    if @chart.destroy
      render json: @chart, status: :ok
    end
  end

  private

  def chart_params
    params.require(:chart).permit(
      :user_id,
      {
        data: [
          :type,
          {
            data: [
              {labels: []},
              {
                _datasets: [
                  :label,
                  :fill,
                  :borderColor,
                  {backgroundColor: []},
                  :lineTension,
                  :pointRadius,
                  {data: []}
                ]
              }
            ]
          },
          {
            options: [
              {
                legend: [
                  :display
                ]
              },
              {
                title: [
                  :display,
                  :text
                ]
              },
              {
                scales: [
                  {
                    yAxes: [
                      {
                        ticks: [
                          :min,
                          :max,
                          :stepSize
                        ],
                      },
                      {
                        scaleLabel: [
                          :display,
                          :labelString
                        ]
                      }
                    ]
                  },
                  {
                    xAxes: [
                      {
                        scaleLabel: [
                          :display,
                          :labelString
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    )
  end
end

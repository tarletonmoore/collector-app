class SeriesController < ApplicationController
  def index
    @series = Series.all
    render :index
  end

  def show
    @series = Series.find_by(id: params[:id])
    render :show
  end
end

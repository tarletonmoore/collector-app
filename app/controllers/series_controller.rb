class SeriesController < ApplicationController
  def index
    @series = Series.all
    render :index
  end

  def show
    @series = Series.find_by(id: params[:id])
    render :show
  end

  def new
    if current_user.admin
      @series = Series.new
      render :new
    end
  end

  def create
    @series = Series.create(
      title: params[:series][:title],

    )
    redirect_to "/series"
  end
end

class SeriesController < ApplicationController
  def index
    if current_user
      @series = Series.all
      render :index
    else
      redirect_to "/login"
    end
  end

  def show
    if current_user
      @series = Series.find_by(id: params[:id])
      render :show
    else
      redirect_to "/login"
    end
  end

  def new
    if !current_user
      redirect_to "/login"
    elsif current_user.admin
      @series = Series.new
      render :new
    else
      redirect_to "/games"
    end
  end

  def create
    @series = Series.create(
      title: params[:series][:title],

    )
    redirect_to "/series"
  end
end

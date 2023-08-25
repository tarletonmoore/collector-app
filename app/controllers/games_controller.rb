class GamesController < ApplicationController
  def index
    if current_user
      @games = Game.all
    else
      redirect_to "/login"
    end
  end

  def new
    if !current_user
      redirect_to "/login"
    elsif current_user.admin
      @game = Game.new
      render :new
    else
      redirect_to "/games"
    end
  end

  def create
    @game = Game.create(
      title: params[:game][:title],
      console: params[:game][:console],
      year: params[:game][:year],
      price: params[:game][:price],
      series_id: Series.find_by(title: params[:game][:series_id]).id,

    )
    redirect_to "/games"
  end
end

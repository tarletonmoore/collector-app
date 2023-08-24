class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    if current_user.admin
      @game = Game.new
      render :new
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

class UserGamesController < ApplicationController
  def create
    if current_user
      @user_game = UserGame.new(
        user_id: current_user.id,
        game_id: params[:game_id],
        is_collected: true,
      )
      @user_game.save
      redirect_to "/games"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user
      @user_game = UserGame.find_by(id: params[:id])
      @user_game.destroy
      redirect_to "/me"
    end
  end
end

class FavoritesGamesController < ApplicationController
  def create
    favorites_game = Game.find(params[:game_id])
    current_user.game_like(favorites_game)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to game_likes_user_path(current_user)
  end

  def destroy
    favorites_game = Game.find(params[:game_id])
    current_user.game_unlike(favorites_game)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to game_likes_user_path(current_user)
  end
end

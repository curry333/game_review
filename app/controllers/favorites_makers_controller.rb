class FavoritesMakersController < ApplicationController
  def create
    favorites_maker = Maker.find(params[:maker_id])
    current_user.maker_like(favorites_maker)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to maker_likes_user_path(current_user)
  end

  def destroy
    favorites_maker = Maker.find(params[:maker_id])
    current_user.maker_unlike(favorites_maker)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to maker_likes_user_path(current_user)
  end
end

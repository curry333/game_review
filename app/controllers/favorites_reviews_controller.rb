class FavoritesReviewsController < ApplicationController
  def create
    favorites_review = Review.find(params[:review_id])
    current_user.review_like(favorites_review)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to favindex_user_path(current_user)
  end

  def destroy
    favorites_review = Review.find(params[:review_id])
    current_user.review_unlike(favorites_review)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to favindex_user_path(current_user)
  end
end

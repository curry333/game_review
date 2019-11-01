class ReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy, :edit, :update]
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def index
    @reviews = Review.order(id: :desc).page(params[:page])
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.review.build(review_params)
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render :new
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
 
    if @review.update(review_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      render :edit
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
    render :edit
    end   
  end
  
  private

  def review_params
    params.require(:review).permit(:game_id, :score, :review)
  end
  
  def correct_user
    @review = current_user.review.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
end

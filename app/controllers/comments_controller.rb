class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @comment = Comment.new
    @review_id = Review.find(params[:review_id]).id
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to reviews_path
    else
      flash[:danger] = 'コメントの投稿に失敗しました。'
      redirect_to reviews_path
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment, :review_id)
  end
  
end

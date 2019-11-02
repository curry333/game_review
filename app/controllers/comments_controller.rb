class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comment.build(comment_params)
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to reviews_path
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render reviews_path
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:user_id, :review_id, :comment)
  end
end

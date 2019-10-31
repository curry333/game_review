class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  def index
  end

  def new
    @review = Review.new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end

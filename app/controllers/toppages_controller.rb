class ToppagesController < ApplicationController
  def index
    @reviews = Review.order(created_at: :desc).limit(5)
  end
end

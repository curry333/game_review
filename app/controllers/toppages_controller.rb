class ToppagesController < ApplicationController
  def index
    @reviews = Review.order(created_at: :desc).limit(5)
    
    reviews_averages = Review.group(:game_id).average(:score)
    @ranks = Hash[reviews_averages.sort_by{ |k, v| -v }]
  end
end

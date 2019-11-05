class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :comment
  has_many :favorites_reviews, foreign_key: 'review_id', dependent: :destroy
  has_many :users, through: :favorites_reviews
  
  
  validates :review, presence: true, length: { maximum: 500 }
  validates :score, presence: true, length: { maximum: 3 }
end

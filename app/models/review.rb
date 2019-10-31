class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  validates :review, presence: true, length: { maximum: 300 }
  validates :score, presence: true, length: { maximum: 5 }
end

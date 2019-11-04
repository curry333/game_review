class Game < ApplicationRecord
  belongs_to :maker
  has_many :review
  has_many :favorites_games, foreign_key: 'game_id', dependent: :destroy
  has_many :users, through: :favorites_games
  
  validates :title, presence: true, length: { maximum: 50 }
end

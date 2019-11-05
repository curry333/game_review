class Maker < ApplicationRecord
  has_many :game
  has_many :favorites_makers, foreign_key: 'maker_id', dependent: :destroy
  has_many :users, through: :favorites_makers
  
  validates :maker, presence: true, length: { maximum: 20 }
end

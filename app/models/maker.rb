class Maker < ApplicationRecord
  has_many :game
  
  validates :maker, presence: true, length: { maximum: 20 }
end

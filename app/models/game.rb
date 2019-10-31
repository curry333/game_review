class Game < ApplicationRecord
  belongs_to :maker
  has_many :review
  
  validates :title, presence: true, length: { maximum: 50 }
end

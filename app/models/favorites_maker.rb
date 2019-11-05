class FavoritesMaker < ApplicationRecord
  belongs_to :user
  belongs_to :maker
end

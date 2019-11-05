class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :review, dependent: :destroy
  has_many :comment
  has_many :favorites_users
  has_many :followings, through: :favorites_users, source: :follow
  has_many :reverses_of_favorites_user, class_name: 'FavoritesUser', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_favorites_user, source: :user
  has_many :favorites_reviews
  has_many :favreviews, through: :favorites_reviews, source: :review
  has_many :favorites_games
  has_many :favgames, through: :favorites_games, source: :game
  has_many :favorites_makers
  has_many :favmakers, through: :favorites_makers, source: :maker
  
  def follow(other_user)
    unless self == other_user
      self.favorites_users.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    favorites_user = self.favorites_users.find_by(follow_id: other_user.id)
    favorites_user.destroy if favorites_user
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def review_like(review)
    favorites_reviews.find_or_create_by(review_id: review.id)
  end

  def review_unlike(review)
    favorites_review = favorites_reviews.find_by(review_id: review.id)
    favorites_review.destroy if favorites_review
  end

  def  favreview?(review)
    self.favreviews.include?(review)
  end
  
  def game_like(game)
    favorites_games.find_or_create_by(game_id: game.id)
  end

  def game_unlike(game)
    favorites_game = favorites_games.find_by(game_id: game.id)
    favorites_game.destroy if favorites_game
  end

  def  favgame?(game)
    self.favgames.include?(game)
  end
  
  
  
  
  def maker_like(maker)
    favorites_makers.find_or_create_by(maker_id: maker.id)
  end

  def maker_unlike(maker)
    favorites_maker = favorites_makers.find_by(maker_id: maker.id)
    favorites_maker.destroy if favorites_maker
  end
  
  def  favmaker?(maker)
    self.favmakers.include?(maker)
  end
end

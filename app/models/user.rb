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
  has_many :reverses_of_favorites_user, class_name: 'Favorites_user', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_favorites_user, source: :user
  
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
end

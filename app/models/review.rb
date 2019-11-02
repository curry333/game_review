class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :comment
  
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
      .game_id_is(search_params[:game_id])
      .maker_id_is(search_params[:maker_id])
      
      
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :game_id_is, -> (game_id) { where(game_id: game_id) if game_id.present? }
  scope :maker_id_is, -> (maker_id) { where(maker_id: maker_id) if maker_id.present? }
  
  validates :review, presence: true, length: { maximum: 500 }
  validates :score, presence: true, length: { maximum: 3 }
end

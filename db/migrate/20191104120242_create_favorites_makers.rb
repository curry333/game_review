class CreateFavoritesMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites_makers do |t|
      t.references :user, foreign_key: true
      t.references :maker, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :maker_id], unique: true
    end
  end
end

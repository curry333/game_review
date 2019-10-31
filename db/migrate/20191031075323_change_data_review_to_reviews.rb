class ChangeDataReviewToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :review, :text
  end
end

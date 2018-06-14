class AddRecommendationCountToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :recommendations_count, :integer
  end
end

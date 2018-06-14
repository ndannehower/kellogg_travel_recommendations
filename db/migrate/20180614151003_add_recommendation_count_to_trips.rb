class AddRecommendationCountToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :recommendations_count, :integer
  end
end

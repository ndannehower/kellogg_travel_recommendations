class AddRecommendationCountToMonths < ActiveRecord::Migration[5.0]
  def change
    add_column :months, :recommendations_count, :integer
  end
end

class AddRecommendationCountToYears < ActiveRecord::Migration[5.0]
  def change
    add_column :years, :recommendations_count, :integer
  end
end

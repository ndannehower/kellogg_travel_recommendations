class AddRecommendationCountToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :recommendations_count, :integer
  end
end

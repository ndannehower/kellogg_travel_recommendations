class AddRecommendationCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :recommendations_count, :integer
  end
end

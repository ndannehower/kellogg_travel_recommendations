class AddRecommendationCountToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :recommendations_count, :integer
  end
end

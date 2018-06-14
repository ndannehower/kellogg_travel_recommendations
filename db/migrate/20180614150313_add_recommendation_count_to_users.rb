class AddRecommendationCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :recommendations_count, :integer
  end
end

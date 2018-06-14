class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :recommendation
      t.integer :category_id
      t.integer :country_id
      t.integer :city_id
      t.string :address
      t.integer :month_id
      t.integer :year_id
      t.integer :trip_id
      t.string :visited_with
      t.integer :rating_id
      t.string :notes
      t.string :photo
      t.integer :user_id

      t.timestamps

    end
  end
end

class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :recommendation
      t.integer :category_id
      t.integer :country_id
      t.integer :city_id
      t.string :address
      t.string :good_for
      t.string :photo
      t.integer :user_id

      t.timestamps

    end
  end
end

class AddAddressLongitudeToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :address_longitude, :float
  end
end

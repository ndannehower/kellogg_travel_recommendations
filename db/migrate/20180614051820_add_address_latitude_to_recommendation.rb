class AddAddressLatitudeToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :address_latitude, :float
  end
end

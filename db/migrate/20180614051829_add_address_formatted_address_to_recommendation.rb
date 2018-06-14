class AddAddressFormattedAddressToRecommendation < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :address_formatted_address, :string
  end
end

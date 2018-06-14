require 'open-uri'
class Recommendation < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :rating,
             :required => false,
             :counter_cache => true

  belongs_to :trip,
             :required => false,
             :counter_cache => true

  belongs_to :year,
             :counter_cache => true

  belongs_to :month,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  belongs_to :category,
             :counter_cache => true

  belongs_to :city,
             :counter_cache => true

  belongs_to :country,
             :counter_cache => true

  # Indirect associations

  # Validations

end

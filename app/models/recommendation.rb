class Recommendation < ApplicationRecord
  # Direct associations

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

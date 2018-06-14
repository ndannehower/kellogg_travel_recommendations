class Recommendation < ApplicationRecord
  # Direct associations

  belongs_to :country,
             :counter_cache => true

  # Indirect associations

  # Validations

end

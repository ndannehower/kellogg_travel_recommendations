class City < ApplicationRecord
  # Direct associations

  has_many   :recommendations,
             :dependent => :nullify

  belongs_to :country,
             :counter_cache => true

  # Indirect associations

  # Validations

end

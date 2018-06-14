class Country < ApplicationRecord
  # Direct associations

  has_many   :cities,
             :dependent => :nullify

  has_many   :recommendations,
             :dependent => :nullify

  # Indirect associations

  # Validations

end

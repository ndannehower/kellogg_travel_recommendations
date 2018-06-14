class Country < ApplicationRecord
  # Direct associations

  has_many   :recommendations,
             :dependent => :nullify

  # Indirect associations

  # Validations

end

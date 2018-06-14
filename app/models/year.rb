class Year < ApplicationRecord
  # Direct associations

  has_many   :trips,
             :dependent => :nullify

  has_many   :recommendations,
             :dependent => :nullify

  # Indirect associations

  # Validations

end

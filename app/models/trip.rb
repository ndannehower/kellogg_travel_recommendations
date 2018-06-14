class Trip < ApplicationRecord
  # Direct associations

  has_many   :recommendations,
             :dependent => :nullify

  belongs_to :year

  # Indirect associations

  # Validations

end

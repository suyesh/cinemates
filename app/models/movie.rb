class Movie < ApplicationRecord
  has_many :movies_lists
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :production_companies

end

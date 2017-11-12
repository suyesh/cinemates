class List < ApplicationRecord
  belongs_to :user
  has_many :movies_lists
  has_many :movies, through: :movies_lists

  enum list_type: [:want_to_watch, :dont_want_to_watch, :seen, :idk]
end

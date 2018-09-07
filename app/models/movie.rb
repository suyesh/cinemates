class Movie < ApplicationRecord
  include DateHelper
  include MovieConcerns::Relationships
  include MovieConcerns::Scopes
end

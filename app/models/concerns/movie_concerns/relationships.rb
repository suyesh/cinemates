module MovieConcerns
  module Relationships
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :genres
      has_and_belongs_to_many :spoken_languages
      has_and_belongs_to_many :production_companies, class_name: 'Production'
      has_and_belongs_to_many :production_countries, class_name: 'Country'
      has_many :videos, class_name: 'MovieVideo'
    end
  end
end

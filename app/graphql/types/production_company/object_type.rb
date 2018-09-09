module Types
  module ProductionCompany
    ObjectType = GraphQL::ObjectType.define do
      name 'ProductionCompany'
      description 'Attributes for ProductionCompany'

      # Basic Attributes for ProductionCompany ######################################
      ############################################################################

      field :id, !types.ID
      field :name, !types.String
      field :logo, types.String, property: :logo_path
      field :country, types.String, property: :origin_country
      field :tmdbId, !types.Int, property: :tmdb_id
      field :movies, function: Resolvers::Movies.new
    end
  end
end

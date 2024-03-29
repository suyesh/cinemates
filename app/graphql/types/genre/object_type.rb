module Types
  module Genre
    ObjectType = GraphQL::ObjectType.define do
      name 'Genre'
      description 'Attributes for Genre'

      # Basic Attributes for genres ##############################################
      ############################################################################

      field :id, !types.ID
      field :tmdbId, !types.Int, property: :tmdb_id
      field :name, !types.String
      field :movies, function: Resolvers::Movies::All.new
    end
  end
end

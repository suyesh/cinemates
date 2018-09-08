module Types
  GenreType = GraphQL::ObjectType.define do
    name 'Genre'
    description 'Attributes for Genre'

    # Basic Attributes for genres ##############################################
    ############################################################################

    field :id, !types.ID
    field :tmdbId, !types.Int, property: :tmdb_id
    field :name, !types.String
    field :movies, function: Resolvers::Movies.new
  end
end

module Types
  MovieType = GraphQL::ObjectType.define do
    name 'Movie'
    description 'Attributes for Movie'

    # Basic Attributes for movies ##############################################
    ############################################################################

    field :id, !types.ID
    field :tmdbId, !types.Int, property: :tmdb_id
    field :imdbId, !types.String, property: :imdb_id
    field :adult, !types.Boolean
    field :originalTitle, !types.String, property: :original_title
    field :title, !types.String
    field :originalLanguage, !types.String, property: :original_language
    field :overview, !types.String
    field :backdropImage, types.String, property: :backdrop_path
    field :budget, types.String
    field :homepage, types.String
    field :popularity, types.Float
    field :posterImage, types.String, property: :poster_path
    field :releaseDate, GraphQL::Types::ISO8601DateTime, property: :release_date
    field :revenue, types.Int
    field :runtime, types.Int
    field :status, types.String
    field :tagline, types.String
    field :video, !types.Boolean
    field :averageVote, types.Float, property: :vote_average
    field :totalVotes, types.Int, property: :vote_count
    field :genres, function: Resolvers::Genres.new
  end
end

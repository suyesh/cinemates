module Resolvers
  class Movies < GraphQL::Function
    description "Query Movies. Eventhough this endpoint provides 'nowPlaying', 'upcoming', 'topRated', 'lowRated', suggested use  is to use dedicated endpoint for it."

    argument :page, types.Int, default_value: 1
    argument :nowPlaying, types.Boolean, default_value: false
    argument :upcoming, types.Boolean, default_value: false
    argument :topRated, types.Boolean, default_value: false
    argument :lowRated, types.Boolean, default_value: false

    type do
      name 'MoviesResults'
      field :totalPages, types.Int
      field :currentPage, types.Int
      field :results, types[Types::MovieType]
    end

    def get_movie_object(obj)
      obj ? obj.movies : Movie
    end

    def check_scopes(movies:, arguments:)
      return movies.upcoming if arguments[:upcoming]
      return movies.now_playing if arguments[:nowPlaying]
      return movies.top_rated if arguments[:topRated]
      return movies.low_rated if arguments[:lowRated]
      movies
    end

    def build_movies(arguments:, object:)
      movies = get_movie_object(object)
      results = check_scopes(movies: movies, arguments: arguments)
    end

    def call(obj, args, _ctx)
      movies = build_movies(arguments: args, object: obj).page(args[:page])
      OpenStruct.new(
        results: movies,
        totalPages: movies.total_pages,
        currentPage: args[:page]
      )
    end
  end
end

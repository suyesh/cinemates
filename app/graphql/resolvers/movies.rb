module Resolvers
  class Movies < GraphQL::Function
    description "Query Movies. Eventhough this endpoint provides 'nowPlaying', 'upcoming', 'topRated', 'lowRated', suggested use  is to use dedicated endpoint for it."

    argument :page, types.Int, default_value: 1
    argument :nowPlaying, types.Boolean, default_value: false
    argument :upcoming, types.Boolean, default_value: false
    argument :topRated, types.Boolean, default_value: false
    argument :lowRated, types.Boolean, default_value: false
    argument :adult, types.Boolean, default_value: false

    type do
      name 'MoviesResults'
      field :total, types.Int
      field :pages, types.Int
      field :currentPage, types.Int
      field :list, types[Types::MovieType]
    end

    def call(obj, args, ctx)
      set_instance_variables(obj, args, ctx)
      OpenStruct.new(
        pages: @movies.total_pages,
        currentPage: @arguments[:page],
        total: get_total,
        list: @movies
      )
    end

    private

    def set_instance_variables(obj, args, ctx)
      @object = obj
      @arguments = args
      @context = ctx
      @movies = build_movies
    end

    def check_adults(object)
      object.where(adult: @arguments[:adult])
    end

    def get_movie_object
      @object ? check_adults(@object.movies) : check_adults(Movie)
    end

    def get_total
      get_movie_object.count
    end

    def check_scopes
      return @movies.upcoming if @arguments[:upcoming]
      return @movies.now_playing if @arguments[:nowPlaying]
      return @movies.top_rated if @arguments[:topRated]
      return @movies.low_rated if @arguments[:lowRated]
      @movies
    end

    def build_movies
      @movies = get_movie_object
      @movies = check_scopes
      @movies.page(@arguments[:page])
    end
  end
end

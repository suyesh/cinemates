module Resolvers
  module Movies
    class All < GraphQL::Function
      include Resolvers::Utils::ResponseStruct
      description "Query Movies. Eventhough this endpoint provides 'nowPlaying', 'upcoming', 'topRated', 'lowRated', suggested use is to use dedicated endpoint for it."

      argument :page, types.Int, default_value: 1
      argument :nowPlaying, types.Boolean, default_value: false
      argument :upcoming, types.Boolean, default_value: false
      argument :topRated, types.Boolean, default_value: false
      argument :lowRated, types.Boolean, default_value: false
      argument :adult, types.Boolean, default_value: false
      argument :popular, types.Boolean, default_value: false

      type Types::Movie::ResponseType

      def call(obj, args, ctx)
        set_instance_variables(obj, args, ctx)
        respond(
          result: @movies,
          arguments: @arguments,
          total: get_total
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
        return @movies.popular if @arguments[:popular]
        @movies
      end

      def build_movies
        @movies = get_movie_object
        @movies = check_scopes
        @movies.page(@arguments[:page])
      end
    end
  end
end

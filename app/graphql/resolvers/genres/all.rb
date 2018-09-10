module Resolvers
  module Genres
    class All < GraphQL::Function
      include Resolvers::Utils::ResponseStruct
      description 'Query genres. It Graphs back to the movies.'

      argument :name, types.String, default_value: 'all'
      argument :page, types.Int, default_value: 1

      type Types::Genre::ResponseType

      def call(obj, args, ctx)
        set_instance_variables(obj, args, ctx)
        respond(
          result: @genres,
          arguments: @arguments,
          total: get_total
        )
      end

      private

      def set_instance_variables(obj, args, ctx)
        @object = obj
        @arguments = args
        @context = ctx
        @genres = build_genres
      end

      def genre_object
        @object ? @object.genres : Genre
      end

      def get_total
        genre_object.count
      end

      def build_genres
        @genres = genre_object.all
        @genres = genre_object.where('name ILIKE ?', "%#{@arguments[:name]}%").all if @arguments[:name] != 'all'
        @genres = @genres.page(@arguments[:page])
      end
    end
  end
end

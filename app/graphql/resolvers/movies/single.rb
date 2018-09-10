module Resolvers
  module Movies
    class Single < GraphQL::Function
      description "Query Movie. Search by id"

      argument :id, !types.Int

      type Types::MovieType

      def call(obj, args, ctx)
        Movie.find(args[:id])
      end
    end
  end
end

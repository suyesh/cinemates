module Resolvers
  module Movies
    class Single < GraphQL::Function
      description "Query Movie by id"

      argument :id, !types.Int

      type Types::Movie::ObjectType

      def call(obj, args, ctx)
        Movie.find(args[:id])
      end
    end
  end
end

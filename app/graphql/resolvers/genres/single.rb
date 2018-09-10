module Resolvers
  module Genres
    class Single < GraphQL::Function
      description 'Query Genre by id'

      argument :id, !types.Int

      type Types::Genre::ObjectType

      def call(obj, args, _ctx)
        Genre.find(args[:id])
      end
    end
  end
end

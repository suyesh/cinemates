module Resolvers
  module SpokenLanguages
    class Single < GraphQL::Function
      description 'get single spoken language. It Graphs back to the movies.'

      argument :id, !types.Int

      type Types::SpokenLanguage::ObjectType

      def call(obj, args, ctx)
        SpokenLanguage.find(args[:id])
      end
    end
  end
end

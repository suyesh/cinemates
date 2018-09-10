module Resolvers
  module SpokenLanguages
    class Single < GraphQL::Function
      description 'Query SpokenLanguage by id'

      argument :id, !types.Int

      type Types::SpokenLanguage::ObjectType

      def call(obj, args, ctx)
        SpokenLanguage.find(args[:id])
      end
    end
  end
end

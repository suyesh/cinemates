module Resolvers
  module ProductionCompanies
    class Single < GraphQL::Function
      description 'Single production company. It Graphs back to the movies.'

      argument :id, !types.Int

      type Types::ProductionCompany::ObjectType

      def call(obj, args, ctx)
        Production.find(args[:id])
      end
    end
  end
end

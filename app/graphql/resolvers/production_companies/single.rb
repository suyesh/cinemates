module Resolvers
  module ProductionCompanies
    class Single < GraphQL::Function
      description 'Query Single production company by Id.'

      argument :id, !types.Int

      type Types::ProductionCompany::ObjectType

      def call(obj, args, ctx)
        Production.find(args[:id])
      end
    end
  end
end

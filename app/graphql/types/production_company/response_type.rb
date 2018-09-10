module Types
  module ProductionCompany
    ResponseType = GraphQL::ObjectType.define do
      name 'ProductionCompanies'
      description 'Response object for ProductionCompanies'

      # Basic Attributes for ProductionCompany #####################################
      ##############################################################################

      field :total, !types.Int
      field :pages, !types.Int
      field :currentPage, !types.Int
      field :list, !types[ObjectType]
    end
  end
end

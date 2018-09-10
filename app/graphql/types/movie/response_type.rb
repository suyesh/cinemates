module Types
  module Movie
    ResponseType = GraphQL::ObjectType.define do
      name 'Movies'
      description 'Response object for Movies'

      # Basic Attributes for ProductionCompany #####################################
      ##############################################################################

      field :total, types.Int
      field :pages, types.Int
      field :currentPage, types.Int
      field :list, types[ObjectType]
    end
  end
end

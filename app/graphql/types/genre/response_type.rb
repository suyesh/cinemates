module Types
  module Genre
    ResponseType = GraphQL::ObjectType.define do
      name 'Genres'
      description 'Response object for Genres'

      # Basic Attributes for genres ##############################################
      ############################################################################

      field :total, types.Int
      field :pages, types.Int
      field :currentPage, types.Int
      field :list, types[ObjectType]
    end
  end
end

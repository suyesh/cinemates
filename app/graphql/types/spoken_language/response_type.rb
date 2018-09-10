module Types
  module SpokenLanguage
    ResponseType = GraphQL::ObjectType.define do
      name 'SpokenLanguages'
      description 'Response object for SpokenLanguages'

      # Basic Attributes for ProductionCompany #####################################
      ##############################################################################

      field :total, types.Int
      field :pages, types.Int
      field :currentPage, types.Int
      field :list, types[ObjectType]
    end
  end
end

module Types
  module SpokenLanguage
    ResponseType = GraphQL::ObjectType.define do
      name 'SpokenLanguages'
      description 'Response object for SpokenLanguages'
      
      interfaces [Types::Interface::ResponseTypeInterface]

      # Basic Attributes for ProductionCompany #####################################
      ##############################################################################

      field :list, types[ObjectType]
    end
  end
end

module Types
  module ProductionCompany
    ResponseType = GraphQL::ObjectType.define do
      name 'ProductionCompanies'
      description 'Response object for ProductionCompanies'
      
      interfaces [Types::Interface::ResponseTypeInterface]

      # Basic Attributes for ProductionCompany #####################################
      ##############################################################################

      field :list, !types[ObjectType]
    end
  end
end

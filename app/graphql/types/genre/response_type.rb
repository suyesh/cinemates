module Types
  module Genre
    ResponseType = GraphQL::ObjectType.define do
      name 'Genres'
      description 'Response object for Genres'

      interfaces [Types::Interface::MetaData]

      # Basic Attributes for genres ##############################################
      ############################################################################

      field :list, !types[ObjectType]
    end
  end
end

module Types
  module Movie
    ResponseType = GraphQL::ObjectType.define do
      name 'Movies'
      description 'Response object for Movies'
      interfaces [Types::Interface::ResponseTypeInterface]

      # Basic Response for Movies  #############################################
      ##########################################################################

      field :list, !types[ObjectType]
    end
  end
end

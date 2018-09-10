module Types
  module SpokenLanguage
    ObjectType = GraphQL::ObjectType.define do
      name 'SpokenLanguage'
      description 'Attributes for SpokenLanguage'

      # Basic Attributes for SpokenLanguage ######################################
      ############################################################################

      field :id, !types.ID
      field :name, !types.String
      field :iso6391, !types.String, property: :iso_639_1
      field :movies, function: Resolvers::Movies::All.new
    end
  end
end

module RootTypes
  class QueryType < BaseTypes::BaseObject
    field :movies, function: Resolvers::Movies.new
  end
end

module RootTypes
  class QueryType < BaseTypes::BaseObject
    field :movies, function: Resolvers::Movies.new
    field :genres, function: Resolvers::Genres.new
  end
end

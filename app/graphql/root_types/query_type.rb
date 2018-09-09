module RootTypes
  class QueryType < BaseTypes::BaseObject
    field :movies, function: Resolvers::Movies.new
    field :genres, function: Resolvers::Genres.new
    field :languages, function: Resolvers::SpokenLanguages.new
    field :productionCompanies, function: Resolvers::ProductionCompanies.new
  end
end

module RootTypes
  class QueryType < BaseTypes::BaseObject
    field :movies, function: Resolvers::Movies.new
    field :allGenres, function: Resolvers::Genres::All.new
    field :genre, function: Resolvers::Genres::Single.new
    field :languages, function: Resolvers::SpokenLanguages.new
    field :productionCompanies, function: Resolvers::ProductionCompanies.new
  end
end

module RootTypes
  class QueryType < BaseTypes::BaseObject
    field :allMovies, function: Resolvers::Movies::All.new
    field :movie, function: Resolvers::Movies::Single.new
    field :allGenres, function: Resolvers::Genres::All.new
    field :genre, function: Resolvers::Genres::Single.new
    field :languages, function: Resolvers::SpokenLanguages.new
    field :productionCompanies, function: Resolvers::ProductionCompanies.new
  end
end

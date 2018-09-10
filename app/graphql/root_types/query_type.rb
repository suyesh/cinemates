module RootTypes
  class QueryType < BaseTypes::BaseObject
    field :allMovies, function: Resolvers::Movies::All.new
    field :movie, function: Resolvers::Movies::Single.new
    field :allGenres, function: Resolvers::Genres::All.new
    field :genre, function: Resolvers::Genres::Single.new
    field :allLanguages, function: Resolvers::SpokenLanguages::All.new
    field :language, function: Resolvers::SpokenLanguages::Single.new
    field :allProductionCompanies, function: Resolvers::ProductionCompanies::All.new
    field :productionCompany, function: Resolvers::ProductionCompanies::Single.new
  end
end

module RootTypes
  class QueryType < BaseTypes::BaseObject
    #Movies
    field :allMovies, function: Resolvers::Movies::All.new
    field :movie, function: Resolvers::Movies::Single.new

    #Genres
    field :allGenres, function: Resolvers::Genres::All.new
    field :genre, function: Resolvers::Genres::Single.new

    #Languages
    field :allLanguages, function: Resolvers::SpokenLanguages::All.new
    field :language, function: Resolvers::SpokenLanguages::Single.new

    #Production Companies
    field :allProductionCompanies, function: Resolvers::ProductionCompanies::All.new
    field :productionCompany, function: Resolvers::ProductionCompanies::Single.new
  end
end

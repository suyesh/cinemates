module Resolvers
  class ProductionCompanies < GraphQL::Function
    description 'Query production companies. It Graphs back to the movies.'

    argument :name, types.String
    argument :tmdbId, types.Int
    argument :country, types.String
    argument :page, types.Int, default_value: 1

    type Types::ProductionCompany::ResponseType

    def production_company_object(obj)
      obj ? obj.production_companies : Production
    end

    def get_total(obj)
      production_company_object(obj).count
    end

    def call(obj, args, _ctx)
      companies = production_company_object(obj).all
      companies = companies if args[:name] == 'all'
      companies = companies.where('name ILIKE ?', "%#{args[:name]}%").all if args[:name] != 'all'
      companies = companies.where('tmdb_id = ?', args[:tmdbId]).all if args[:tmdbId]
      companies = companies.where('origin_country ILIKE ?', "%#{args[:country]}%") if args[:country]
      companies = companies.page(args[:page])
      OpenStruct.new(
        pages: companies.total_pages,
        currentPage: args[:page],
        total: get_total(obj),
        list: companies
      )
    end
  end
end

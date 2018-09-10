module Resolvers
  module ProductionCompanies
    class All < GraphQL::Function
      description 'Query production companies. It Graphs back to the movies.'

      argument :name, types.String
      argument :tmdbId, types.Int
      argument :country, types.String
      argument :page, types.Int, default_value: 1

      type Types::ProductionCompany::ResponseType

      def call(obj, args, ctx)
        set_instance_variable(obj, args, ctx)
        OpenStruct.new(
          pages: @production_companies.total_pages,
          currentPage: @arguments[:page],
          total: get_total,
          list: @production_companies
        )
      end

      private

      def set_instance_variable(obj, args, ctx)
        @object = obj
        @arguments = args
        @context = ctx
        @production_companies = build_production_companies
      end

      def production_company_object
        @object ? @object.production_companies : Production
      end

      def get_total
        production_company_object.count
      end

      def build_production_companies
        @production_companies = production_company_object.all
        @production_companies = @production_companies if @arguments[:name] == 'all'
        @production_companies = @production_companies.where('name ILIKE ?', "%#{@arguments[:name]}%").all if @arguments[:name] != 'all'
        @production_companies = @production_companies.where('tmdb_id = ?', @arguments[:tmdbId]).all if @arguments[:tmdbId]
        @production_companies = @production_companies.where('origin_country ILIKE ?', "%#{@arguments[:country]}%") if @arguments[:country]
        @production_companies.page(@arguments[:page])
      end
    end
  end
end

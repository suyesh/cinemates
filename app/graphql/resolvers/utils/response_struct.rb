module Resolvers
  module Utils
    module ResponseStruct
      def respond(result:, arguments:, total: )
        OpenStruct.new(
          pages: result.total_pages,
          currentPage: arguments[:page],
          total: total,
          list: result
        )
      end
    end
  end
end

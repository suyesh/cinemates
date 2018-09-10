module Resolvers
  module SpokenLanguages
    class All < GraphQL::Function
      description 'Query spoken languages. It Graphs back to the movies.'

      argument :name, types.String, default_value: 'all'
      argument :page, types.Int, default_value: 1

      type Types::SpokenLanguage::ResponseType

      def call(obj, args, ctx)
        set_instance_variables(obj, args, ctx)
        OpenStruct.new(
          pages: @languages.total_pages,
          currentPage: @arguments[:page],
          total: get_total,
          list: @languages
        )
      end

      private

      def set_instance_variables(obj, args, ctx)
        @object = obj
        @arguments = args
        @context = ctx
        @languages = build_languages
      end

      def language_object
        @object ? @object.spoken_languages : SpokenLanguage
      end

      def get_total
        language_object.count
      end

      def build_languages
        @languages = language_object.all if @arguments[:name] == 'all'
        @languages = language_object.where('name ILIKE ?', "%#{@arguments[:name]}%") if @arguments[:name] != 'all'
        @languages.page(@arguments[:page])
      end
    end
  end
end

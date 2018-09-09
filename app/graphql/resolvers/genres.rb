module Resolvers
  class Genres < GraphQL::Function
    description 'Query genres. It Graphs back to the movies.'

    argument :name, types.String, default_value: 'all'
    argument :page, types.Int, default_value: 1

    type Types::Genre::ResponseType

    def genre_object(obj)
      obj ? obj.genres : Genre
    end

    def get_total(obj)
      genre_object(obj).count
    end

    def call(obj, args, _ctx)
      genres = genre_object(obj).all
      genres = genre_object(obj).where('name ILIKE ?', "%#{args[:name]}%").all if args[:name] != 'all'
      genres = genres.page(args[:page])
      OpenStruct.new(
        pages: genres.total_pages,
        currentPage: args[:page],
        total: get_total(obj),
        list: genres
      )
    end
  end
end

module Resolvers
  class Genres < GraphQL::Function
    description 'Query genres. It Graphs back to the movies.'

    type !types[Types::GenreType]
    argument :name, types.String, default_value: 'all'

    def genre_object(obj)
      obj ? obj.genres : Genre
    end

    def call(obj, args, ctx)
      return genre_object(obj).all if args[:name] == 'all'
      return genre_object(obj).where('name ILIKE ?', "%#{args[:name]}%").all
    end
  end
end

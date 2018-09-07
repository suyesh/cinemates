module Resolvers
  class Movies < GraphQL::Function
    description 'Query movies'

    type !types[Types::MovieType]

    def call(obj, args, ctx)
      [Movie.first]
    end
  end
end

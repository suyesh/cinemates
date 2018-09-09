module Resolvers
  class SpokenLanguages < GraphQL::Function
    description 'Query spoken languages. It Graphs back to the movies.'

    type !types[Types::SpokenLanguageType]
    argument :name, types.String, default_value: 'all'

    def language_object(obj)
      obj ? obj.spoken_languages : SpokenLanguage
    end

    def call(obj, args, _ctx)
      return language_object(obj).all if args[:name] == 'all'
      language_object(obj).where('name ILIKE ?', "%#{args[:name]}%").all
    end
  end
end

module Types
  module Interface
    ResponseTypeInterface = GraphQL::InterfaceType.define do
      name "ResponseTypeInterface"
      description "Generic fields needed in every response"

      field :total, !types.Int
      field :pages, !types.Int
      field :currentPage, !types.Int
    end
  end
end

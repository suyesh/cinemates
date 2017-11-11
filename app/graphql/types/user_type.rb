module Types
  UserType = GraphQL::ObjectType.define do
    name "User"
    description "A user"

    field :id, !types.Int
    field :email, !types.String
  end
end

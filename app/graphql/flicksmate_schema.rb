class FlicksmateSchema < GraphQL::Schema
  mutation(RootTypes::MutationType)
  query(RootTypes::QueryType)
end

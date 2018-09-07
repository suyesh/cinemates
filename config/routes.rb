Rails.application.routes.draw do
  post "/api", to: "graphql#execute"
end

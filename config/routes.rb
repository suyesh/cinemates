Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post "/api", to: "graphql#execute"
end

Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'user_token', to: 'user_token#create'
    end
  end
end
# "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDQxODcyOTIsInN1YiI6Mn0.rxf42WIerDPjNGJxPhw0PZg7SBYDNBq6gxTAlNPPDpo"

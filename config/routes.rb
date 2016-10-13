Rails.application.routes.draw do

  namespace :api do
  	namespace :v1 do
  		post '/login', to: "sessions#create"
      # get '/itineraries/:search', to: "itineraries#search"
      post '/itineraries/:search', to: "itineraries#search"
      post '/itineraries/:my_lyst', to: "itineraries#my_lyst"
      get '/itineraries/:id', to: "itineraries#show"
      # We will likely need to limit the routes for the below resources:
      resources :activities
      resources :locations
      resources :days
      resources :itineraries
      resources :users
  	end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

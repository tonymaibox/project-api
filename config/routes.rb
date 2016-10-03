Rails.application.routes.draw do
  resources :activities
  resources :locations
  resources :days
  resources :itineraries
  resources :users

  namespace :api do
  	namespace :v1 do
  		post '/login', to: "sessions#create"
  	end
  end
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

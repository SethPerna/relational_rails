Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/cities', to: 'cities#index'
  get '/cities/:id', to: 'cities#show'
  get '/venues', to: 'venues#index'
  get 'venues/:id', to: 'venues#show'
  get 'cities/:city_id/venues', to: 'city_venues#index'
end

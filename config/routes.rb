Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  post '/cities', to: 'cities#create'
  get '/cities/:id', to: 'cities#show'
  get '/cities/:city_id/venues', to: 'city_venues#index'
  get '/cities/:id/edit', to: 'cities#edit'
  patch '/cities/:id', to: 'cities#update'
  get '/venues', to: 'venues#index'
  get '/venues/new', to: 'venues#new'
  post '/venues', to: 'venues#create'
  get '/venues/:id', to: 'venues#show'





  get '/dealers', to: 'dealers#index'
  get '/dealers/:id', to: 'dealers#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/dealers/:dealer_id/cars', to: 'dealer_cars#index'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  post '/cities', to: 'cities#create'
  get '/cities/:id', to: 'cities#show'
  get '/cities/:city_id/venues', to: 'city_venues#index'
  get '/cities/:id/edit', to: 'cities#edit'
  patch '/cities/:id', to: 'cities#update'
  delete '/cities/:id', to: 'cities#destroy'
  delete '/cities', to: 'cities#destroy'


  get '/venues', to: 'venues#index'
  get '/venues/:id', to: 'venues#show'
  get 'cities/:id/venues/new', to: 'venues#new'
  post 'cities/:id/venues', to: 'venues#create'
  get '/venues/:id/edit', to: 'venues#edit'
  patch '/venues/:id', to: 'venues#update'
  delete '/venues/:id', to: 'venues#destroy'





  get '/dealers', to: 'dealers#index'
  get '/dealers/:id', to: 'dealers#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/dealers/:dealer_id/cars', to: 'dealer_cars#index'
end

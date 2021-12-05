Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'
  get '/venues', to: 'venues#index'
  get '/venues/:id', to: 'venues#show'
  get '/cities/:city_id/venues', to: 'city_venues#index'
  post '/cities', to: 'cities#create'
  get '/cities/:id/edit', to: 'cities#edit'
  patch '/cities/:id', to: 'cities#update'





  get '/dealers', to: 'dealers#index'
  get '/dealers/:id', to: 'dealers#show'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/dealers/:dealer_id/cars', to: 'dealer_cars#index'
end

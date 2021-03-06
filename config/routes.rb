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
  get '/dealers/new', to: 'dealers#new'
  post '/dealers', to: 'dealers#create'
  get '/dealers/:id', to: 'dealers#show'
  get '/dealers/:dealer_id/cars', to: 'dealer_cars#index'
  get 'dealers/:id/edit', to: 'dealers#edit'
  patch '/dealers/:id', to: 'dealers#update'
  delete '/dealers/:id', to: 'dealers#destroy'
  

  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/dealers/:id/cars/new', to: 'cars#new'
  post '/dealers/:id/cars', to: 'cars#create'
  get '/cars/:id/edit', to: 'cars#edit'
  patch '/cars/:id', to: 'cars#update'
  delete '/cars/:id', to: 'cars#destroy'

end

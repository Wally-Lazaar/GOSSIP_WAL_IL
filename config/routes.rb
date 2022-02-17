Rails.application.routes.draw do

  get 'comments/create'
  get 'cities/show'
  root to: 'gossips#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:first_name', to: 'greets#greet'

  resources :gossips do 
    resources :comments
  end
  resources :comments
  
  resources :users do
    resources :gossips
  end
  resources :cities, only: [:show]

end

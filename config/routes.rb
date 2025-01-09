Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
  end

  root "products#public_index"


  get 'signup', to: 'users#new' 
  post 'signup', to: 'users#create'


  get '/admin', to: 'products#index', as: 'admin_products'
end

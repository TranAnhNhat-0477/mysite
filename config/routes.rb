Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
  end

  root "products#index"


  get 'signup', to: 'users#new' 
  post 'signup', to: 'users#create'
end

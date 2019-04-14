Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create]
  resources :charts, only: [:index, :show, :update, :create, :destroy]

  post '/login', to: 'auth#login'
end

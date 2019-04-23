Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api do
  #   namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :charts, only: [:index, :show, :update, :create, :destroy]

      post '/login', to: 'auth#login'
      get '/auto_login', to: 'auth#auto_login'
      get '/', to: 'charts#root'
  #   end
  # end
end

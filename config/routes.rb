Rails.application.routes.draw do
  # resources :users do
  #   collection do
  #     get :search
  #   end
  # end  
  resources :users
  get '/search', to: 'users#search', as: 'search'
  root 'users#index'
end

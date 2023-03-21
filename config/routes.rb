Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login', to: 'authentication#login'
  post '/admin/login', to: 'admin_authentication#admin_login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create, :update, :destroy]
      resources :products, only: [:index, :show] do
        collection do
          get 'new_products'
        end
      end
      resources :categories, only: [:index]
      resources :wishlists, only: [:index, :create, :destroy]
      resources :brands, only: [:index]
    end
  end

  resources :admins
  namespace :admin, defaults: { format: :json } do
    resources :users, only: [:index]
    resources :products, only: [:create, :update, :destroy]
    resources :brands, only: [:create, :update, :destroy]
    resources :categories, only: [:create, :update, :destroy]
  end
end
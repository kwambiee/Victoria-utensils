Rails.application.routes.draw do
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login', to: 'authentication#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :products do
        collection do
          get 'new_products'
        end
      end
      resources :categories
      resources :brands
      scope '/admin' do
        resources :users
      end
    end
  end

end

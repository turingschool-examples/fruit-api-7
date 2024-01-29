Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  resources :fruits, only: %i[create index]

  namespace :fruits do
    resources :nutritional, only: %i[index]
  end
end

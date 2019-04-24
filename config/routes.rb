Rails.application.routes.draw do
  root 'books#index'
  get 'static_pages/index'

  resources :books

  get    "login",  to: "static_pages#show"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

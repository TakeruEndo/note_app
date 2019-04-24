Rails.application.routes.draw do
  get 'books/new'
  root 'static_pages#index'
  get 'static_pages/show'

  get    "login",  to: "static_pages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

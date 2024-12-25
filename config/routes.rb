Rails.application.routes.draw do

  root "pages#home"
  resources :articles
  resources :users
  get "about", to: "pages#about"
  get "signup", to: "users#new"
end

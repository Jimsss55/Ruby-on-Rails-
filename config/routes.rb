Rails.application.routes.draw do

  root 'pages#home'
  resources :articles

  get 'about' , to: 'pages#about'
end

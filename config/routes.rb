Rails.application.routes.draw do
  root 'pages#home'

  resources :articles
  resources :journals#, only: [:show, index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books#, only: [:show]

 
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'welcome', to: 'pages#welcome'
end

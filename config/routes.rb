Rails.application.routes.draw do
  resources :articles
  resources :journals#, only: [:show, index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'welcome', to: 'pages#welcome'
end

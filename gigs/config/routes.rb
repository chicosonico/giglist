Rails.application.routes.draw do
  devise_for :users
  resources :gigs
  # get 'home/index'
  get 'home/about'
  get 'home/balance'
  get 'gigs/index'
  # root 'home#index'
  # root 'gigs#index'
  root 'home#balance'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

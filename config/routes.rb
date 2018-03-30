Rails.application.routes.draw do
  
  root 'feeds#index'
  devise_for :users
  resources :activities
    resources :posts
    resources :shares 

  #devise_for :users
end

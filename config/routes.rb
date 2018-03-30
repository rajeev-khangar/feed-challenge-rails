Rails.application.routes.draw do
  
  root 'feeds#index'
  get "/feed", to: "feeds#index"
  
end

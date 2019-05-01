Rails.application.routes.draw do

  #get 'user/:id', to: 'user#user'
  #get 'welcome/:user_entry', to: 'welcome#first_name'
#  get '/team', to: 'team#team'
  #get '/contact', to: 'contact#contact'
  resources :gossip #ok
  resources :home
  root 'home#index'
  resources :welcome
  resources :contact
  resources :user
  resources :team



end

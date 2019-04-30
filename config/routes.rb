Rails.application.routes.draw do

  get 'user/:id', to: 'user#user'
  get 'welcome/:user_entry', to: 'welcome#first_name'
  get '/home', to: 'home#home'
  get '/team', to: 'team#team'
  get '/contact', to: 'contact#contact'
  get '/gossip/:id', to: 'gossip#gossip'
end

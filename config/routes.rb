TestApp::Application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :posts
  match '/admin', :to => 'posts#admin'
  match '/new', :to => 'posts#new'
  match '/edit/:id', :to => 'posts#edit'
  post '/preview', :to => 'posts#preview'
  put '/preview', :to => 'posts#preview'
  get '/:slug', :to => 'posts#show', :as => 'post'
  delete '/:slug', :to => 'posts#destroy', :as  => 'post'
  put '/:slug', :to => 'posts#update', :as  => 'post'
  root :to => 'users#new'


end

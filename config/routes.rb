TestApp::Application.routes.draw do

  resources :posts, only: [:create]
  resource :search, only: [:show] do
    member do
      get "tag" => "searches#tags"
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :update]

  match "/admin", to: "dashboards#admin"
  match "/dashboard", to: "dashboards#index"
  match "/new", to: "posts#new"
  match "/edit/:id", to: "posts#edit"
  post "/preview", to: "posts#preview"
  put "/preview", to: "posts#preview"
  get "/:slug", to: "posts#show", as: "post"
  delete "/:slug", to: "posts#destroy", as: "post"
  put "/:slug", to: "posts#update", as: "post"
  root to: "users#new"


end

Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'articles/delete_all'
  resources:articles do
    resources :comments
  end
  resources :articles_api do
    resources :comments
  end
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  root 'welcome#index'
end

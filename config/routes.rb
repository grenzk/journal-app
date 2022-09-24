Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # root 'welcome#index'
  # root 'categories#index'

  resources :categories
end

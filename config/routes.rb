Rails.application.routes.draw do
  # root 'welcome#index'
  root 'categories#index'

  resources :categories
end

Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :categories do
    resources :line_item_dates, except: %i[index show]
  end
end

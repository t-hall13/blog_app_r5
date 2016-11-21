Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  root to: 'articles#index'
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

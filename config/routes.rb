Rails.application.routes.draw do
  resources :projects
  resources :categories

  root 'categories#index'
end

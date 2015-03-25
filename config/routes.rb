Rails.application.routes.draw do
  resources :projects do
    get :like, on: :member
  end
  resources :categories

  root 'categories#index'
end

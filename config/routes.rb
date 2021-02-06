 Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :work_of_arts, only: [:index], module: :users
  end
  resources :work_of_arts, only: [:show, :new, :create, :index, :update, :edit, :destroy]
  resources :collabs do
    resources :users_collabs, only: [:new]
    resources :exhibitions, only: [:new]
  end
  resources :exhibitions, except: [:new]
  resources :users_collabs, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

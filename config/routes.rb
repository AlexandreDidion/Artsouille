 Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :work_of_arts, only: [:index], module: :users
  end
  resources :work_of_arts, only: [:show, :new, :create, :index, :update, :edit, :destroy]
  resources :collabs do
    resources :user_collab_relationships, only: [:new]
    resources :exhibitions, only: [:new, :create]
  end
  resources :exhibitions, except: [:new, :create]
  resources :user_collab_relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

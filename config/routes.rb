Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :work_of_arts, only: [:show, :edit, :update, :delete ]
  end
  resources :work_of_arts, only: [:new, :create, :index]
  resources :collabs do
    resources :exhibitions, only: [:new, :create, :show, :edit, :update, :delete]
  end
  resources :exhibitions, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

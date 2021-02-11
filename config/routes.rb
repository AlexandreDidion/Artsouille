 Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :work_of_arts, only: [:index], module: :users do
      resources :work_of_arts_favorites, only: [:create, :destroy]
    end
  end
  resources :work_of_arts, only: [:show, :new, :create, :index, :update, :edit, :destroy] do
    member do
      post 'toggle_favorite', to: "work_of_arts#toggle_favorite"
    end
  end
  get 'myfavorites', to: "work_of_arts#my_favorites"
  resources :collabs do
    resources :users_collabs, only: [:new]
    resources :exhibitions, only: [:new]
  end
  resources :exhibitions, except: [:new]
  resources :users_collabs, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

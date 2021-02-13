 Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :work_of_arts, only: [:index], module: :users
  end
  resources :work_of_arts, only: [:show, :new, :create, :index, :update, :edit, :destroy] do
    member do
      post 'toggle_favorite', to: "work_of_arts#toggle_favorite"
    end
  end
  get 'myfavorites', to: "work_of_arts#my_favorites"
  resources :collabs do
    resources :user_collab_relationships, only: [:new]
    resources :exhibitions, only: [:new, :create]
    resources :to_dos, only: [:new, :create]
  end
  resources :exhibitions, except: [:new, :create]
  resources :user_collab_relationships, only: [:create, :destroy]
  resources :to_dos, only: [:destroy, :edit, :update] do
    resources :to_do_items, only: [:new, :create]
  end
  resources :to_do_items, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

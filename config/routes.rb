Rails.application.routes.draw do
  root to: 'users#show'

  resources :users, only: [:new, :create, :show] do
    resources :accounts, only: [:index, :new, :edit]
    resources :wish_lists, only: [:index, :new, :edit]
  end
  resource :session, only: [:new, :create, :destroy]

  resources :accounts, only: [:create, :show, :update, :destroy]
  resources :wish_lists, only: [:create, :show, :update, :destroy]
  resources :comments, only: [:create, :update, :destroy]

  get  'static_pages/about'
end

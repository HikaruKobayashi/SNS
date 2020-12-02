Rails.application.routes.draw do
  namespace :v1 do
    resources :tweets, only: [:create, :destroy]
    resources :users, only: [:index, :show, :create]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end

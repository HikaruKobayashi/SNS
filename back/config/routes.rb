Rails.application.routes.draw do
  namespace :v1 do
    resources :tweets, only: [:index, :show, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :blogs
    resources :users, only: [:index, :show, :edit, :create] do
      member do
        post '/follow', to: 'relationships#create'
        delete '/unfollow', to: 'relationships#destroy'
        patch '/update_image', to: 'users#update_image'
      end
    end
  end
  # mount ActionCable.server => '/cable'
end

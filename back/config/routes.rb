Rails.application.routes.draw do
  namespace :v1 do
    resources :tweets, only: [:index, :show, :create, :destroy] do
      resources :comments, only: [:index]
    end
    resources :comments, only: [:create]
    resources :blogs do
      resources :blog_comments, only: [:index]
      resources :blog_likes, only: [:index]
    end
    resources :blog_comments, only: [:create]
    resources :blog_likes, only: [:create]
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

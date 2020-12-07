Rails.application.routes.draw do
  namespace :v1 do
    resources :tweets do
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :create] do
      member do
        post '/follow', to: 'relationships#create'
        delete '/unfollow', to: 'relationships#destroy'
      end
    end
  end
end

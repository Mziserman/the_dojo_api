Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :sessions, only: [:show, :create, :destroy]
      resources :streams, only: [:index, :create, :destroy]
    end
  end
end

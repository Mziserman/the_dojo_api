Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :sessions, only: [:create, :destroy]
      resources :streams, only: [:index]
    end
  end
end

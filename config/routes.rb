Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :session, only: [:create, :destroy]
      resources :stream, only: [:index]
    end
  end
end

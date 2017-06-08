Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :files, only: [:create]
      resource :users, only: [:show, :create, :destroy, :update]
      resource :sessions, only: [:show, :create, :destroy]
      resources :streams, only: [:index, :create, :destroy, :show]
      resources :categories, only: [:index, :show]
      get '/categories/:category/:sub_category', to: 'sub_categories#show'
      get '/streams/create_stream/:channel', to: 'streams#create_stream'
      get '/streams/update_stream/:channel', to: 'streams#update_stream'
      get '/home', to: 'home#index'
    end
  end
end

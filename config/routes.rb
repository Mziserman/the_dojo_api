Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :users, only: [:show, :create, :destroy]
      resource :sessions, only: [:show, :create, :destroy]
      resources :streams, only: [:index, :create, :destroy, :show]
      get '/streams/create_stream/:channel', to: 'streams#create_stream'
      get '/streams/update_stream/:channel', to: 'streams#update_stream'
    end
  end
end

Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :users, only: [:show, :create, :destroy]
      resource :sessions, only: [:show, :create, :destroy]
      # resource :stream_files, only: [:create]
      resources :streams, only: [:index, :create, :destroy, :show]
      resources :categories, only: [:index, :show]
      resources :sub_categories, only: [:index, :show]
      get '/streams/create_stream/:channel', to: 'streams#create_stream'
      get '/streams/update_stream/:channel', to: 'streams#update_stream'
      post '/files/create', to: 'files#create'
      post '/files/commit/:id', to: 'files#commit'
    end
  end
end

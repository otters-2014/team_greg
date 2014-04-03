KnowledgeBombs::Application.routes.draw do

  root 'sessions#new'
  post '/sessions' => 'sessions#create', as: :session #=> session_path


  get '/users/new', to: 'users#new', as: :new_user
  get '/users/:id', to: 'users#show', as: :user
  get '/users', to: 'users#index', as: :users
  get '/users/:id/edit', to: 'users#edit', as: :edit_user
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  post '/users', to: 'users#create'
end

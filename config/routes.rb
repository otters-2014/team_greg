KnowledgeBombs::Application.routes.draw do

  root 'sessions#new'
  # post '/sessions' => 'sessions#create', as: :session #=> session_path
  # delete '/logout' =>'sessions#destroy', as: :logout
  resources :sessions
  resources :users

end

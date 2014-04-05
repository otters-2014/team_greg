KnowledgeBombs::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'sessions#new'
  # post '/sessions' => 'sessions#create', as: :session #=> session_path
  # delete '/logout' =>'sessions#destroy', as: :logout
  resources :sessions
  resources :users

end

KnowledgeBombs::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'sessions#new'
  resources :sessions

  resources :kbombs
  get '/users/:id/kbombs/:id/delete' => 'kbombs#destroy', as: :remove_kbomb
  get '/users/:id/kbombs' => 'kbombs#index', as: :add_kbombs #=> add_kbombs_path

  resources :users do
    resources :conversations
    resources :kbombs
  end
end

KnowledgeBombs::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'sessions#new'

  resources :sessions

  resources :users do
    resources :conversations, only: :show
  end

  post '/conversations/:conversation_id/messages' => 'messages#create', as: :conversation_messages

end

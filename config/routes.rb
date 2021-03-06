Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :wagons do
    resources :comments, only: [:create]
    member do
      post 'like'
    end
  end
  
  get '/signup', to: 'corsogroups#new'
  resources :corsogroups, except: [:new]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :ingredients, except: [:destroy]
  
  mount ActionCable.server => '/cable'
  get '/chat', to: 'chatrooms#show'
  
  resources :messages, only: [:create]

end

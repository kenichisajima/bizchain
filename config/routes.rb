Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :meetings
      get :participating_meetings
    end
  end
  
  resources :meetings, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :participations, only: [:create, :destroy]
end

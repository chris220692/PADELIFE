Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :players do
      resources :player_reviews
    end
    resources :teachers do
      resources :teacher_reviews
    end
    resources :clubs do
      resources :fields
    end
  end

  resources :clubs, only: [:index]
  resources :players, only: [:index]
  resources :teachers, only: [:index]
end

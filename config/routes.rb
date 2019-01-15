Rails.application.routes.draw do

  get 'teacher_reviews/index'
  get 'teacher_reviews/show'
  get 'teacher_reviews/new'
  get 'teacher_reviews/create'
  get 'teacher_reviews/edit'
  get 'teacher_reviews/update'
  get 'teacher_reviews/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :players
    resources :teachers do
      resources :teacher_reviews
    end
    resources :clubs
  end

end

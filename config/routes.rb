Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users, path_names: {
    sign_up: 'new'
  }
  root to: 'homes#top'
  resources :users

  post 'reservations' => 'reservations#create'
  resources :sheets
  resources :movies, only: %i[index show] do
    resources :schedules do
      resources :reservations, only: %i[new create]
    end
    resource :favorites, only: [:create, :destroy]
    get 'reservation' => 'movies#reservation'
  end

  namespace :admin do
    resources :movies do
      resources :schedules, only: %i[new create]
    end
    resources :reservations, only: %i[index show new create update destroy]

    resources :schedules, only: %i[index show edit update destroy]
  end
end

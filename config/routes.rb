Rails.application.routes.draw do
  devise_for :users, path_names: {
    sign_up: 'new'
  }

  post 'reservations' => 'reservations#create'
  resources :sheets
  resources :movies, only: %i[index show] do
    resources :schedules do
      resources :reservations, only: %i[new create]
    end
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

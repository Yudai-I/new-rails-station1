Rails.application.routes.draw do
  devise_for :users, path_names: {
    sign_up: 'new'
  }

  post 'reservations' => 'reservations#create'
  resources :sheets
  resources :movies, only:[:index, :show] do
      resources :schedules do
        resources :reservations, only:[:new, :create]
      end
      get 'reservation' => 'movies#reservation'
  end

  namespace :admin do
    resources :movies do
      resources :schedules, only: [:new, :create]
    end
    resources :reservations, only: [:index, :show, :new, :create, :update, :destroy]

    resources :schedules, only: [:index, :show, :edit, :update, :destroy]
  end
  
end

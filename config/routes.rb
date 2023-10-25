Rails.application.routes.draw do
  get 'reservations/new'
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

    resources :schedules, only: [:index, :show, :edit, :update, :destroy]
  end
  
end

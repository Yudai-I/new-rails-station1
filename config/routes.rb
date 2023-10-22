Rails.application.routes.draw do
  resources :sheets
  resources :movies, only:[:index, :show]

  namespace :admin do
    resources :movies do
      resources :schedules, only: [:new, :create]
    end

    resources :schedules, only: [:index, :show, :edit, :update, :destroy]
  end
  
end

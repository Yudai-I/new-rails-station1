Rails.application.routes.draw do
  resources :sheets
  resources :movies, only:[:index, :show]

  namespace :admin do
    resources :movies do
      resources :schedules
    end

    resources :schedules
  end
  
end

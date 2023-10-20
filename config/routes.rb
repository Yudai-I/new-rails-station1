Rails.application.routes.draw do
  get 'schedules/index'
  get 'schedules/show'
  get 'schedules/edit'
  resources :sheets
  resources :movies, only:[:index, :show]

  namespace :admin do
    resources :movies do
  end
end
  
end

Rails.application.routes.draw do
  get 'sheets/index'
  resources :movies, only:[:index, :show]

  namespace :admin do
    resources :movies do
  end
end
  
end

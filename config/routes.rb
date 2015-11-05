Rails.application.routes.draw do
  resources :tubes, only: [:index]
end

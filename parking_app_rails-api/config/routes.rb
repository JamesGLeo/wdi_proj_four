Rails.application.routes.draw do
  resources :signs, only: [:index] # may want to use multiple pages later
end

Rails.application.routes.draw do
  get 'track', to: 'opens#track'

  resources :campaigns, only: [:create, :show]
end

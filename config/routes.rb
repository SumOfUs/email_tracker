Rails.application.routes.draw do
  get 'track', to: 'opens#track'
  get 'clicks', to: 'urls#track'

  resources :campaigns, only: [:create, :show]
  resources :urls, only: [:show]
end

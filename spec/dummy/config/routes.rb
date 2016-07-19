Rails.application.routes.draw do
  root              to: 'application#index'
  get '/show', to: 'application#show', as: :show
  delete '/destroy', to: 'application#destroy', as: :destroy
end

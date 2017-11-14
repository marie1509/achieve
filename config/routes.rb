Rails.application.routes.draw do
  
  get '/vlogs', to:'vlogs#index'
  resources :vlogs
end

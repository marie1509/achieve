Rails.application.routes.draw do
  
  get '/vlogs', to:'vlogs#index'
  resources :vlogs do
    collection do
      post :confirm
    end
  end
end

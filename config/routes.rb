Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      jsonapi_resources :books
      jsonapi_resources :users
      jsonapi_resources :pages
    end
  end
  
end

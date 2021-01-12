Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do 
    namespace :v1 do
      resources :items, except: %i[edit new]
      resources :outfits, except: %i[edit new]
      resources :categories, only: %i[index create destroy]
    end
  end
end

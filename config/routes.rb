Rails.application.routes.draw do


  get 'creditcards/index'

  get 'creditcards/edit'



  get 'buys/index'

  devise_for :users, controllers: {
        registratinos: 'users/registrations'
      }
  root 'items#index'
  resources :users
  resources :items do
    resources :buys, only: [:new,:create,:update] do
      collection do
        post 'pay'
      end
    end
    resources :comments
  end
  resources :phonenumber
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

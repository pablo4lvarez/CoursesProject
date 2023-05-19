Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
 
  resources :courses do
    get 'signup', to: 'courses#signup'
    get 'unsubscribe', to: 'courses#unsubscribe'
    resources :clases
    resources :resenas
    resources :forums do
      resources :messages
    end
  end

  ######### ROOT #########
  get 'home', to: 'home#index'
  root to: 'home#index'

  get "users/:id", to: "users#show", as: "users_show"
end

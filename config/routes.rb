Rails.application.routes.draw do

  # active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # items controller
  resources :items

  # users could sign up multiple times
  resources :users

  # users can only make one session
  resource :session

  get "about", to: "pages#about"

  root "pages#home"

end

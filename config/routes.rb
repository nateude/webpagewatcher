Rails.application.routes.draw do

  # Static Page Routes
  root 'static_pages#home'

  get  '/home',     to: 'static_pages#home'
  get  '/help',     to: 'static_pages#help'

  resources :websites
  resources :profiles
  resources :reports

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

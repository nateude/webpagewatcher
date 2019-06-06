Rails.application.routes.draw do
  # Static Page Routes
  root 'dashboard#index'

  get  '/home',     to: 'dashboard#index'
  # get  '/help',     to: 'static_pages#help'

  resources :websites
  resources :profiles
  resources :reports

  get 'reports/:id/json', to: 'reports#json', defaults: { format: 'json' }, as: :report_json

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

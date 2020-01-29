Rails.application.routes.draw do
  root 'dashboard#index'

  get  '/home', to: 'dashboard#index'

  resources :websites
  resources :profiles do
    collection do
      # get '/:id/init', to: 'webpagetest_api#init', as: :run_test
    end
  end
  resources :reports do
    collection do
      get '/update', to: 'reports#update_all', as: :update_all
      get '/pingback', to: 'reports#pingback', as: :pingback
    end
  end

  get 'reports/:id/json', to: 'reports#json', defaults: { format: 'json' }, as: :report_json

  devise_for :user, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end

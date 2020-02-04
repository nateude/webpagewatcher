Rails.application.routes.draw do
  root 'dashboard#index'

  get '/home',      to: 'dashboard#index'
  get '/pingback',  to: 'pingback#pingback',  as: :pingback
  get '/admin',     to: 'admin#index',        as: :admin

  resources :websites

  resources :profiles do
    collection do
      # get '/:id/init', to: 'webpagetest_api#init', as: :run_test
    end
  end

  resources :reports do
    collection do
      get '/run',       to: 'reports#run_all', as: :run_all
      get '/update',    to: 'reports#update_all', as: :update_all
      get '/:id/json',  to: 'reports#json', defaults: { format: 'json' }, as: :report_json
    end
  end

  devise_for :user, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end

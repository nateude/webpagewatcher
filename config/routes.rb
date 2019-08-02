Rails.application.routes.draw do
  # Static Page Routes
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
    end
  end

  get 'reports/:id/json', to: 'reports#json', defaults: { format: 'json' }, as: :report_json

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'water_reports' => 'water_source_reports#index'
  get 'water_source_reports/:id' => 'water_source_reports#show', as: 'water_source_reports'
  get 'water_purity_reports/:id' => 'water_purity_reports#show', as: 'water_purity_reports'


  resources :users do
  	resources :water_purity_reports
  	resources :water_source_reports
  end

end

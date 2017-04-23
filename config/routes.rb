Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get ':id/ban_user/:user_id' => 'users#ban_user', as: 'ban_user'
  get ':id/unban_user/:user_id' => 'users#unban_user', as: 'unban_user'
  get ':id/user_lists' => 'users#user_lists', as: 'user_lists'
  delete ':id/delete_account/:user_id' => 'users#destroy', as: 'delete_account'


  get 'water_reports' => 'water_source_reports#index'
  get 'water_source_reports/:id' => 'water_source_reports#show', as: 'water_source_reports'
  get 'water_purity_reports/:id' => 'water_purity_reports#show', as: 'water_purity_reports'
  delete 'water_purity_reports/:id' => 'water_purity_reports#destroy', as: 'water_purity_reports_destroy'
  delete 'water_source_reports/:id' => 'water_source_reports#destroy', as: 'water_source_reports_destroy'

  resources :users do
  	resources :water_purity_reports
  	resources :water_source_reports
  end

end

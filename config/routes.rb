Rails.application.routes.draw do

  namespace :users do
    get 'dashboards/index'
  end
  root 'welcome#index'
  
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
    resources :dashboards
    resources :communities
  end
end

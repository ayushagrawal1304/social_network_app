Rails.application.routes.draw do

  namespace :users do
    get 'dashboards/index'
  end
  root 'welcome#index'
  
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
    resources :dashboards   

    resources :communities do
      member do
        get "invite_user"
      end
    end

    resources :invitations do
      member do
        put "accept"
      end
    end
  end
end

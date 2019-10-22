require 'sidekiq/web'
Rails.application.routes.draw do

  mount ActionCable.server, at: '/cable'
  mount Sidekiq::Web => '/sidekiq'

  namespace :users do
    get 'dashboards/index'
  end
  root 'welcome#index'
  
  devise_for :users, controllers: { registrations: 'users/registrations',
   sessions: 'users/sessions', confirmations: 'users/confirmations', passwords: 'users/passwords'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
    resources :dashboards do
      member do
        get "my_communities"
        get "joined_communities"
      end
    end

    resources :communities do
      resources :posts do 
        resources :likes do
          member do
            get "like_by"
          end
        end   
        resources :comments do
          member do
            get "nested_comments"
          end
        end
      end
      
      member do
        get "invite_user"
      end
    end

    resources :invitations do
      member do
        put "accept"
        get "decline"
      end
    end
  end

  namespace :api do 
    namespace :v1 do 
      resources :communities
    end 
  end 
end

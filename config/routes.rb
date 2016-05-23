Rails.application.routes.draw do

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        get :me, on: :collection
      end
      resources :messages, only: [:create, :show] do
        collection do
          get :sent
          get :unread
          get :read
        end
      end
      resources :sessions, only: :create
    end
  end

  get 'welcome/index'
  root 'welcome#index'

end

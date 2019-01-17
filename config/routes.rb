# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :meisters, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'sessions' }
  root 'tests#index'

  resources :users, only: :create
  resources :sessions, only: :create

  get 'profile', to: 'profile#show'

  get 'contact_us', to: 'messages#new'
  resources :messages, only: :create

  resources :badges, only: :index

  resources :tests, only: :index do
    resources :questions, shallow: true, only: :show do
      resources :answers, shallow: true
    end

    collection do
      get :table
    end

    member do
      post :start
    end
  end

  namespace :admin do
    resources :badges
    resources :gists, only: :index

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: %i[show index]
      end
    end
  end

  # GET /participations/101/result
  resources :participations, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

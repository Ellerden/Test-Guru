# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'

  #get :signup, to: 'users#new'
  #get :login, to: 'sessions#new'
  #get :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  namespace :admin do
    resources :tests
  end

  # GET /participations/101/result
  resources :participations, only: %i[show update] do
    member do
      get :result
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

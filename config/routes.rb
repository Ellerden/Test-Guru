# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  # GET /participations/101/result
  resources :participations, only: %i[show update] do
    member do
      get :result
    end
  end

  get :signup, to: 'users#new'
  resources :users, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  resources :participations, only: %i[show update] do
    member do
      get :result
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

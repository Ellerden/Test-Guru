Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end
  get '/tests/:test_id/questions/:id(.:format)' =>'questions#pluck'
  post '/questions' =>'questions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

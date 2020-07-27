Rails.application.routes.draw do
  root 'pages#index'
  resources :posts
  # get '/user' => 'profiles#show', as: :user_root
  resources :profiles, except: [:destroy]


  #controllers object is for redirecting after sign-up. see registrations_controllers.rb
  #path_names are for URL names
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }, controllers: { registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

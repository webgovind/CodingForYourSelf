Rails.application.routes.draw do
  get 'users/sign_in', to: 'sessions#new'
  post 'authentication/login', to: 'authentication#login'
  post 'authentication/signout', to: 'authentication#signout'
  get 'authentication/signout', to: 'authentication#signout'

  scope '/authentication' do
    resources :users
  end


  root to: "main#index"
  get 'main', to: 'main#home'

end

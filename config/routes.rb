Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  namespace :api do
    get '/', to: 'welcome#index'
    post '/sign_in', to: 'authentication#sign_in'
    post '/sign_up', to: 'authentication#sign_up'
    post '/forgot_password', to: 'authentication#forgot_password'
  end
end

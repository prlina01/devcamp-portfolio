Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  resources :blogs
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

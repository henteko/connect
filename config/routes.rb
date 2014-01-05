Connect::Application.routes.draw do

  resources :pages, path: 'page'

  devise_for :users, path: 'user'

  root 'home#index'

end

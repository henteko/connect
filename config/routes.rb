Connect::Application.routes.draw do

  resources :wikis, path: 'wiki'

  devise_for :users, path: 'user'

  root 'home#index'

end

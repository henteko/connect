Connect::Application.routes.draw do

  resources :pages, path: 'page'
  resources :blogs, path: 'blog'

  devise_for :users, path: 'user'

  root 'home#index'

end

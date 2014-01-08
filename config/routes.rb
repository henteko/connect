Connect::Application.routes.draw do


  devise_for :users, path: 'user'

  root 'home#index'

  # Page routing
  resources :pages, path: 'page', except: [:index, :show]
  get '/page/:url'     => 'pages#show'

  # Blog routing
  resources :blogs, path: 'blog', except: [:index, :show]
  get '/:username'     => 'blogs#index'
  get '/:username/:id' => 'blogs#show'

end

Connect::Application.routes.draw do


  devise_for :users, path: 'user'

  root 'home#index'

  # Page routing
  resources :pages, path: 'page', except: [:index, :show, :edit]
  get '/page/:url'         => 'pages#show'
  get '/page/:url/edit'    => 'pages#edit'
  get '/page/:url/history' => 'pages#history'

  # Blog routing
  resources :blogs, path: 'blog', except: [:index, :show]
  get '/:username'             => 'blogs#index'
  get '/:username/:id'         => 'blogs#show'
  get '/:username/:id/history' => 'blogs#history'

end

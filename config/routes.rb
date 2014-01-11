Connect::Application.routes.draw do

  devise_for :users, path: 'user', controllers: { invitations: 'users/invitations' }

  root 'pages#show', url: 'home'

  # User routing
  resource :user, only: [:edit, :update]

  # Admin setting routing
  get '/admin' => 'admin#index'
  namespace :admin do
    get 'notification'
    get 'role'
  end

  # Link routing
  resources :links, except: [:show]

  # Page routing
  resources :pages, except: [:show, :edit]
  get '/pages/:url'         => 'pages#show'
  get '/pages/:url/edit'    => 'pages#edit'
  get '/pages/:url/history' => 'pages#history'

  # Blog routing
  resources :blogs, path: 'blog', except: [:index, :show]
  get '/:username'             => 'blogs#index'
  get '/:username/:id'         => 'blogs#show'
  get '/:username/:id/history' => 'blogs#history'

end

Connect::Application.routes.draw do

  devise_for :users, path: 'user', controllers: { invitations: 'users/invitations' }

  root 'pages#show', page_name: 'home'

  # User routing
  resource :user, only: [:edit, :update]

  # Admin setting routing
  get '/admin' => 'admin#index'
  namespace :admin do
    resource :notification, only: [:show, :update]
    get 'role'
  end

  # Link routing
  resources :links, except: [:show]

  # Page routing
  resources :pages, except: [:show, :edit]
  get '/pages/:page_name'         => 'pages#show'
  get '/pages/:page_name/edit'    => 'pages#edit'
  get '/pages/:page_name/history' => 'pages#history'

  # Blog routing
  resources :blogs, path: 'blog', except: [:new, :show, :edit]
  get '/:username'             => 'blogs#index'
  get '/:username/new'         => 'blogs#new'
  get '/:username/:id'         => 'blogs#show'
  get '/:username/:id/edit'    => 'blogs#edit'
  get '/:username/:id/history' => 'blogs#history'

end

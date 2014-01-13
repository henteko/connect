Connect::Application.routes.draw do

  devise_for :users, path: 'user', controllers: { invitations: 'users/invitations' }

  root 'pages#show', page_names: 'home'

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
  get '/pages/:page_names/edit'    => 'pages#edit', page_names: /[\w\-\/]+/
  get '/pages/:page_names/history' => 'pages#history', page_names: /[\w\-\/]+/
  get '/pages/:page_names'         => 'pages#show', page_names: /[\w\-\/]+/

  # Blog routing
  resources :blogs, path: 'blog', except: [:new, :show, :edit]
  get '/:username'             => 'blogs#index'
  get '/:username/new'         => 'blogs#new'
  get '/:username/:id'         => 'blogs#show'
  get '/:username/:id/edit'    => 'blogs#edit'
  get '/:username/:id/history' => 'blogs#history'

end

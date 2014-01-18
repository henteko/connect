Connect::Application.routes.draw do

  devise_for :users, path: 'user', controllers: { invitations: 'users/invitations' }

  # Comment routing
  resources :comments, only: [:create, :update, :destroy]

  # User routing
  resource :user, only: [:edit, :update]

  # Admin setting routing
  namespace :admin do
    resource :notification, only: [:show, :update]
    resources :users, except: [:new, :show, :create]
  end

  # Link routing
  resources :links, except: [:show]

  # Page routing
  root 'pages#show', id: 'home'
  resources :pages, id: /[\w\-]+/ do
    member do
      get 'history'
    end
  end

  # Blog routing
  resources :blogs, path: 'blog', except: [:new, :show, :edit]
  get '/:username'             => 'blogs#index'
  get '/:username/new'         => 'blogs#new'
  get '/:username/:id'         => 'blogs#show'
  get '/:username/:id/edit'    => 'blogs#edit'
  get '/:username/:id/history' => 'blogs#history'

end

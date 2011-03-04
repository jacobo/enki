Enki::Application.routes.draw do
  namespace 'admin' do
    resource :session

    resources :posts, :pages do
      post 'preview', :on => :collection
    end
    resources :comments
    resources :undo_items do
      post 'undo', :on => :member
    end

    match 'health(/:action)' => 'health', :action => 'index', :as => :health
    # admin.resources :posts, :new => {:preview => :post}
    resources :works
    # admin.resources :pages, :new => {:preview => :post}
    # admin.resources :comments, :member => {:mark_as_spam => :put, :mark_as_ham => :put}
    # admin.resources :tags
    # admin.resources :undo_items, :member => {:undo => :post}

    root :to => 'dashboard#show'
  end

  resources :archives, :only => [:index]
  resources :pages, :only => [:show]

  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    post ':year/:month/:day/:slug/comments' => 'comments#index'
    get ':year/:month/:day/:slug/comments/new' => 'comments#new'
    get ':year/:month/:day/:slug' => 'posts#show'
  end

  scope :to => 'posts#index' do
    get 'posts.:format', :as => :formatted_posts
    get 'blog/(:tag)', :as => :posts
  end

  # match '/works', :controller => "works", :action => 'index'
  # match '/works/:category', :to => 'works#show_category', :as => "category"
  # match '/works/:category/:id', :to => 'works#show_work', :as => "work_in_category"
  resources :works

  # map.root :controller => 'pages', :action => 'show', :id => "home"
  # map.resources :posts
  # 
  # works_in_category '/work/:category', :controller => 'works', :action => 'show'
  # work 'work/:category/:id', :controller => 'works', :action => 'show'
  # works '/work', :controller => 'works', :action => 'index'
  # 
  # map.resources :pages

  root :to => 'pages#home'
end

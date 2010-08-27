  ActionController::Routing::Routes.draw do |map|
    
  map.namespace :asset_manager do |manager|    
    manager.resources :assets, :collection => { :select_stage => :post, :deselect_stage => :post }, :has_many => [:captions, :credits, :tags]
    manager.resource :password_reset
    manager.resources :stages, :collection => {:added => :put, :removed => :put }, :member => { :contract => :get, :manage_users => :get, :add_user => :post, :remove_user => :post }
    manager.resources :captions
    manager.resources :credits 
    manager.resources :languages, :has_many => :captions
    manager.resources :asset_users
    manager.resources :tags
    manager.resources :tribes, :has_many => :assets
    manager.resources :countries, :has_many => :assets
    
    #manager.resources :asset_users
    manager.resources :asset_user_sessions
    manager.login "login", :controller => :asset_user_sessions, :action => :new
    manager.logout "logout", :controller => :asset_user_sessions, :action => :destroy
    
    manager.root :controller => :asset_user_sessions, :action => :new
  end

  map.resources :admin_users
  map.resources :admin_user_sessions
  map.login "login", :controller => :admin_user_sessions, :action => :new
  map.logout "logout", :controller => :admin_user_sessions, :action => :destroy
  map.root :controller => "AssetManager::Assets"
  
end

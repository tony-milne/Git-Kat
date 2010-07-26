  ActionController::Routing::Routes.draw do |map|
  map.resources :credits

  map.resources :credits

map.resources :captions
  
  map.namespace :asset_manager do |manager|    
  manager.resources :assets, :collection => {:gallery => :get}, :has_many => [:captions, :credits]
  manager.resource :password_reset
  #manager.resources :user_sessions
  manager.resources :captions
  manager.resources :credits 
  manager.resources :languages, :has_many => :captions
  manager.resources :users
  
  
  end
  

  map.resources :user_sessions
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.root :controller => "AssetManager::Assets"
#  map.root :controller => "AssetManager::Captions"
#  map.root :controller => "AssetManager::Credits"
  #map.connect 'caption', :conditions => { :method => :get }, :controller => "caption", :action => :show
  map.resources :assets do |asset|
  asset.resources :captions, :credits, :collection
  end
  map.root :assets
end

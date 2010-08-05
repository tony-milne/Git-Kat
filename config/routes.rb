  ActionController::Routing::Routes.draw do |map|
  #map.resources :tribes
  #map.resources :countries

  #map.resources :tags
  #map.resources :credits
  #map.resources :captions 
  
  map.namespace :asset_manager do |manager|    
  manager.resources :assets, :collection => {:gallery => :get}, :has_many => [:captions, :credits, :tags]
  manager.resource :password_reset
  manager.resources :stages, :collection => {:added => :put, :removed => :put }
  manager.resources :captions
  manager.resources :credits 
  manager.resources :languages, :has_many => :captions
  manager.resources :users
  manager.resources :tags
  manager.resources :tribes, :has_many => :assets
  manager.resources :countries, :has_many => :assets
  end

  map.resources :user_sessions
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.root :controller => "AssetManager::Assets"
  
end

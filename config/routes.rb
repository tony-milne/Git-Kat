  ActionController::Routing::Routes.draw do |map|
<<<<<<< HEAD
  map.resources :tribes

  #map.resources :tags
  #map.resources :credits
  #map.resources :captions
  
=======
    
>>>>>>> d1b8e47f1f22cdbeb74b5974172e154fa4b75ae8
  map.namespace :asset_manager do |manager|    
  manager.resources :assets, :collection => {:gallery => :get}, :has_many => [:captions, :credits, :tags]
  manager.resource :password_reset
  manager.resources :stages, :collection => {:added => :put, :removed => :put }
  manager.resources :captions
  manager.resources :credits 
  manager.resources :languages, :has_many => :captions
  manager.resources :users
  manager.resources :tags
  end

  map.resources :user_sessions
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.root :controller => "AssetManager::Assets"
  
end

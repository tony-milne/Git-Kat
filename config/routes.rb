ActionController::Routing::Routes.draw do |map|

  
  map.namespace :asset_manager do |manager|    
  manager.resources :assets, :collection => {:gallery => :get}, :has_many => :captions
  manager.resource :password_reset
  #manager.resources :user_sessions
  manager.resources :captions, :belongs_to => :assets #:collection => {:action=>"show", :controller=>"asset_manager/captions"}
  manager.resources :languages, :has_many => :captions
  manager.resources :users
  
  end
  

  map.resources :user_sessions
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.root :controller => "AssetManager::Assets"


end

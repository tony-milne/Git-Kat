ActionController::Routing::Routes.draw do |map|
  
  
  map.namespace :asset_manager do |manager|    
  manager.resources :assets, :has_many => :tags, :collection => {:gallery => :get}
  manager.resource :password_reset
  #manager.resources :user_sessions
  manager.resources :users
  manager.resources :tags#, :has_many => :assets
  end
  

  map.resources :user_sessions
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.root :controller => "AssetManager::Assets"

end

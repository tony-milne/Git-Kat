ActionController::Routing::Routes.draw do |map|
  
  
  map.namespace :asset_manager do |manager|    
  manager.resources :assets, :collection => {:gallery => :get}
  
  manager.login "login", :controller => "user_sessions", :action => "new"
  manager.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  manager.resource :password_reset
  manager.resources :user_sessions
  manager.resources :users
  end
  
  map.root :controller => "AssetManager::Assets"

end

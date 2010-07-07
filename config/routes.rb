ActionController::Routing::Routes.draw do |map|
  map.resources :assets, :collection => {:gallery => :get}
  
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.resource :password_reset
  map.resources :user_sessions
  map.resources :users
  map.root :assets
end

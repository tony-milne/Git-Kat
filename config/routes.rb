ActionController::Routing::Routes.draw do |map|

  map.resources :stages, :collection => {:added => :put, :removed => :put}
  
  

  #map.resources :stage_items

  map.resources :assets, :collection => {:gallery => :get}
  
  
  
  #Simons Stage Stuff ere
  map.resources :stageassets, :collection = {:stageasset => :get}
  #End of stage stuff ere
  
  
  
  
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.resource :password_reset
  map.resources :user_sessions
  map.resources :users
  map.root :assets
end

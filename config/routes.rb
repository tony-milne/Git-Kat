  ActionController::Routing::Routes.draw do |map|
    
  map.namespace :asset_manager do |manager|    
    manager.resources :assets, :collection => { :select_stage => :post, :deselect_stage => :post },
                      :has_many => [:captions, :credits, :tags]
    manager.resources :stages, :collection => {:add_asset_to_stage => :put },
                      :member => { :manage_users => :get, :add_user => :post, :remove_user => :post,
                      :contract => :get, :agree => :get,
                      :remove_asset_from_stage => :put }
    manager.resources :languages
    manager.resources :tribes
    manager.resources :countries
    manager.resources :contracts
    
    manager.resources :asset_users
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

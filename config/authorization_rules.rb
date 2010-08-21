authorization do
  
  role :admin_user do
    # Controller permissions
    has_permission_on :asset_manager_asset_users, :to => [:index, :show, :edit, :all_privileges]
    has_permission_on :asset_manager_assets, :to => [:index, :show, :new, :edit, :search, :destroy, :update, :create]
    has_permission_on [:asset_manager_tags, :asset_manager_tribes, :asset_manager_credits, :asset_manager_captions, :asset_manager_countries, :asset_manager_languages], :to => [:index, :show, :new, :edit, :destroy, :update, :create]
    has_permission_on :asset_manager_stages, :to => [:index, :show, :edit, :new, :all_privileges]
    
    # Model permissions    
    has_permission_on [:assets, :tags, :captions, :images, :countries, :credits, :tribes], :to => :all_privileges
  end
  
  role :asset_user do
    # Controller permissions
    has_permission_on :asset_manager_asset_users, :to => [:edit, :update]
    has_permission_on :asset_manager_assets, :to => [:index, :show, :view]
    #has_permission_on :asset_manager_stages, :to => [:index, :show, :edit, ]
    
    # Model permissions
    has_permission_on [:assets, :tags, :captions, :images, :contries, :credits, :tribes], :to => :view
  end
  
  role :guest do
    # Controller permissions
    has_permission_on :asset_manager_login, :to => :all_privileges
    has_permission_on :asset_manager_asset_users, :to => [:new, :edit, :create, :read]
    
    # Permissions required when migrating. Uncomment when migrating.
    #has_permission_on [:languages, :countries, :tribes], :to => :all_privileges
  end
  
end

# 
privileges do
  
  privilege :all_privileges do
    includes :create, :read, :update, :delete
  end
  
  privilege :view do
    includes :read
  end
  
end
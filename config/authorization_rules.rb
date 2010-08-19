authorization do
  
  role :admin_user do
    has_permission_on :asset_manager_asset_users, :to => [:index, :show, :edit, :all_privileges]
    has_permission_on :asset_manager_assets, :to => [:index, :show, :new, :edit, :search, :all_privileges]
    has_permission_on :asset_manager_tags, :to => [:index, :show, :edit, :new, :all_privileges]
    has_permission_on :asset_manager_stages, :to => [:index, :show, :edit, :new, :all_privileges]
    has_permission_on :asset_manager_tribes, :to => [:index, :show, :edit, :new, :all_privileges]
    has_permission_on :asset_manager_credits, :to => [:index, :show, :edit, :new, :all_privileges]
    has_permission_on :asset_manager_captions, :to => [:index, :show, :edit, :new, :all_privileges]
    has_permission_on :asset_manager_countries, :to => [:index, :new, :edit, :new, :all_privileges]
    has_permission_on :asset_manager_languages, :to => [:index, :new, :edit, :new, :all_privileges]
  end
  
  role :asset_user do
    #includes :guest
    has_permission_on :asset_manager_asset_users, :to => [:edit, :update]
    has_permission_on :asset_manager_assets, :to => [:index, :show, :view]
    #has_permission_on :asset_manager_stages, :to => [:index, :show, :edit, ]
  end
  
  role :guest do
    has_permission_on :asset_manager_login, :to => :all_privileges
    has_permission_on :asset_manager_asset_users, :to => [:new, :edit, :create, :read]
  end
  
end

privileges do
  
  privilege :all_privileges do
    includes :create, :read, :update, :delete
  end
  
  privilege :view do
    includes :read
  end
  
end

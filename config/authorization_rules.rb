authorization do
  role :admin_user do
    has_permission_on :asset_manager_users, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_assets, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_tags, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_stages, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_tribes, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_credits, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_captions, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_countries, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :asset_manager_languages, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :asset_user do
    includes :guest
    has_permission_on :asset_manager_assets, :to => [:index, :show]
  end
  
  role :guest do
    #has_permission_on :asset_manager_users, :to => [:index, :show, :new, :create]
    has_permission_on :asset_manager_user_sessions, :to => [:new, :create]
    has_permission_on :asset_manager_asset_user_sessions, :to => [:new, :create]
    #has_permission_on :asset_manager_assets, :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
end


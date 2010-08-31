authorization do

  role :admin_user do
    # Controller permissions
    has_permission_on :asset_manager_asset_users, :to => [:index, :edit, :all_privileges]
    has_permission_on :asset_manager_assets, :to => [:index, :show, :new, :edit, :search, :destroy, :update, :create, :select_stage, :deselect_stage]
    has_permission_on [:asset_manager_tags, :asset_manager_tribes, :asset_manager_credits, :asset_manager_captions, :asset_manager_countries, :asset_manager_languages], :to => [:index, :show, :new, :edit, :destroy, :update, :create]
    has_permission_on :asset_manager_stages, :to => [:index, :show, :edit, :new, :create, :update, :destroy, :add_asset_to_stage, :remove_asset_from_stage, :manage_users, :add_user, :remove_user, :manage_contract, :set_contract]
    
    # Model permissions    
    has_permission_on [:assets, :tags, :captions, :images, :countries, :credits, :tribes, :contracts], :to => :all_privileges
    has_permission_on :stages do
      to :all_privileges
    end
  end

  role :asset_user do
    # Controller permissions
    has_permission_on :asset_manager_asset_users, :to => [:edit, :update]
    has_permission_on :asset_manager_assets, :to => [:index, :show]
    
    has_permission_on :asset_manager_stages, :to => [:index, :contract, :agree]
    has_permission_on :asset_manager_stages do
      to :show
      if_attribute :asset_users => contains { user }
    end

    # Model permissions
    has_permission_on [:assets, :tags, :captions, :images, :contries, :credits, :tribes], :to => :read
    has_permission_on :stages do
      to :read
      if_attribute :asset_users => contains { user }
    end
  end

  role :guest do
    # Controller permissions
    has_permission_on :asset_manager_login, :to => :all_privileges
    has_permission_on :asset_manager_asset_users, :to => [:new, :edit, :create, :read]
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


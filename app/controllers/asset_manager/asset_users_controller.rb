class AssetManager::AssetUsersController < ApplicationController
  def new
    @asset_user = AssetUser.new
  end
  
  def create
    @asset_user = AssetUser.new(params[:asset_user])
    if @ssset_user.save
      @asset_user.asset_user_roles.create(:name => "asset_user")
      flash[:notice] = "Registration successful."
      redirect_to asset_manager_root_url
    else
      render :action => :new
    end
  end
  
  def edit
    @asset_user = current_user
  end
  
  def update
    @asset_user = current_user
    if @asset_user.update_attributes(params[:asset_user])
      flash[:notice] = "Successfully updated profile."
      redirect_to asset_manager_root_url
    else
      render :action => :edit
    end
  end
end

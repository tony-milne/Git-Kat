class AssetManager::AssetUsersController < ApplicationController
  #add before filter to check user is logged out before trying to create new user
  #filter_resource_access
  filter_access_to :all
  
  def index
    @asset_users = AssetUsers.find(:all)
  end
  
  def show
    @asset_user = AssetUser.find(params[:id])
  end
  
  def new
    @asset_user = AssetUser.new
  end
  
  def create
    @asset_user = AssetUser.new(params[:asset_user])
    if @asset_user.save
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

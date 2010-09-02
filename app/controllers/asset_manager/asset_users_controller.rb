# AssetUsers controller handles actions relating to asset users.

class AssetManager::AssetUsersController < ApplicationController
  # Declarative authorization method to enable permissions based filtering of
  # actions.  Doesn't automatically load assets.
  filter_access_to :all
  
  # GET /asset_users
  def index
    @asset_users = AssetUser.find(:all)
  end
  
  # GET /asset_users/1
  def show
    @asset_user = AssetUser.find(params[:id])
  end
  
  # GET /asset_users/new
  def new
    @asset_user = AssetUser.new
  end
  
  # POST /asset_users
  def create
    @asset_user = AssetUser.new(params[:asset_user])
    if @asset_user.save
      flash[:notice] = "Registration successful."
      redirect_to asset_manager_root_url
    else
      render :action => :new
    end
  end
  
  # GET /asset_users/1/edit
  def edit
    if current_user.class.to_s.eql? "AdminUser"
      @asset_user = AssetUser.find(params[:id])
    else
      @asset_user = current_user
    end
  end
  
  # PUT /asset_users/1
  def update
    @asset_user = current_user
    if @asset_user.update_attributes(params[:asset_user])
      flash[:notice] = "Successfully updated profile."
      redirect_to asset_manager_root_url
    else
      render :action => :edit
    end
  end
  
  # DELETE /asset_users/1
  def destroy
    @asset_user = AssetUser.find(params[:id])
    @asset_user.destroy
    if @asset_user.save
      redirect_to asset_manager_asset_users_path, :notice => "User successfully deleted"
    else
      redirect_to asset_manager_asset_user_path(@asset_user)
    end
  end
end

class AssetManager::AssetUserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy
  before_filter :require_no_user, :only => [:new, :create]
  
  def new
    @asset_user_session = AssetUserSession.new
  end
  
  def create
    @asset_user_session = AssetUserSession.new(params[:asset_user_session])
    if @asset_user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to asset_manager_root_url
    else
      render :action => :new
    end
  end
  
  def destroy
    @asset_user_session = AssetUserSession.find
    @asset_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to asset_manager_login_url
  end
end

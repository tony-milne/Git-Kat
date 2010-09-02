# AssetUserSession controller handles actions relating to asset user sessions.

class AssetManager::AssetUserSessionsController < ApplicationController
  # Before filter run on the destroy action ensures that a user is logged in
  before_filter :require_user, :only => :destroy
  
  # Before filter run on new and create actions ensures that user is not
  # logged in
  before_filter :require_no_user, :only => [:new, :create]
  
  # GET /asset_user_sessions/new
  def new
    @asset_user_session = AssetUserSession.new
  end
  
  # POST /asset_user_sessions
  def create
    @asset_user_session = AssetUserSession.new(params[:asset_user_session])
    if @asset_user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to asset_manager_root_url
    else
      render :action => :new
    end
  end
  
  # DELETE /asset_user_sessions/1
  def destroy
    @asset_user_session = AssetUserSession.find
    @asset_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to asset_manager_login_url
  end
end

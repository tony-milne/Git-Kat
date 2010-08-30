# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class AssetManager::ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").

  filter_parameter_logging :password
  
  helper_method :current_user, :current_user_session
  
  helper_method :verify_credentials
  
  before_filter :set_current_user

  protected
 
  def set_current_user
    Authorization.current_user = current_user
  end
  
  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to asset_manager_login_url
  end

  private
  
  def current_user_session
    if AdminUserSession.find
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = AdminUserSession.find
    elsif AssetUserSession.find
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = AssetUserSession.find
    end
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      if flash[:notice].blank?
        flash[:notice] = "Please login to continue"
      else
        flash.keep(:notice)
      end
      
      redirect_to asset_manager_login_path
    end
  end
  
  def require_no_user
    if current_user
      flash[:notice] = "You must be logged out to view this page"
      redirect_to asset_manager_assets_path
      return false
    end
  end
  
end

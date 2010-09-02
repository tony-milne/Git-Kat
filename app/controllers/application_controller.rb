# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
# Contains methods related to authlogic and declarative authorization.
# Also provides methods used in before filters to ensure the user is logged in
# or logged out on appropriate pages.
#
# This file will be removed by the client and replaced with their own
# implementation.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  filter_parameter_logging :password
  
  # Provides authlogic methods in application
  helper_method :current_user, :current_user_session
  
  # Before filter that ensures that current user is set for declarative auth.
  before_filter :set_current_user

  protected

  # Required: sets the current (logged in) user for use by declarative 
  # authorization
  def set_current_user
    Authorization.current_user = current_user
  end

  # Upon a denied request (from declarative authorization,) the user is
  # redirected to the login page
  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to asset_manager_login_url
  end

  private
  
  # Method checks to see if an admin is logged in (by checking AdminUserSession,)
  # else checks to see if an asset user is logged in and returns the respective
  # user object
  def current_user_session
    if AdminUserSession.find
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = AdminUserSession.find
    elsif AssetUserSession.find
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = AssetUserSession.find
    end
  end

  # Method returns the current user based on whether or not they are logged in
  # i.e. there is an entry in either the AdminUserSession or AssetUserSession
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  # Method that checks whether or not a user is logged in.
  # If no user is logged in, redirects to the asset user login page
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

  # Method that checks whether or not a user is logged in.
  # If a user is logged in, redirects to the asset manager home page
  def require_no_user
    if current_user
      flash[:notice] = "You must be logged out to view this page"
      redirect_to asset_manager_assets_path
      return false
    end
  end
  
end

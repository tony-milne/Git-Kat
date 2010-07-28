# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class AssetManager::ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").

  filter_parameter_logging :password
  
  helper_method :admin_restrictions
  
  helper_method :current_user
  
  helper_method :verify_credentials

  private

	def admin_restrictions
		if User.count >= 1 
			flash[:notice] = "An admin user already exists."
			redirect_to login_path
		end
	end	
			
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def verify_credentials
    if !current_user
      if flash[:notice].blank?
        flash[:notice] = "Please login to continue"
      else
        flash.keep(:notice)
      end
      
      redirect_to login_path
    end
  end 
  
end

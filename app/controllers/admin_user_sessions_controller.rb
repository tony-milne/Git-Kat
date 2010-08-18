class AdminUserSessionsController < ApplicationController
  def new
    @admin_user_session = AdminUserSession.new
  end
  
  def create
    @admin_user_session = AdminUserSession.new(params[:admin_user_session])
    if @admin_user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @admin_user_session = AdminUserSession.find
    @admin_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end

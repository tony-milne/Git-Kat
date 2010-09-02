# AdminUserSessions controller handles actions relating to AdminUserSessions
# This file will be removed by the client and replaced with their own
# implementation.

class AdminUserSessionsController < ApplicationController
  
  # PUT /admin_user_session/new
  def new
    @admin_user_session = AdminUserSession.new
  end
  
  # POST /admin_user_sessions
  def create
    @admin_user_session = AdminUserSession.new(params[:admin_user_session])
    if @admin_user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  # DELETE /admin_user_sessions/1
  def destroy
    @admin_user_session = AdminUserSession.find
    @admin_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end

# AdminUsers controller handles actions relating to AdminUsers.
# This file will be removed by the client and replaced with their own
# implementation.

class AdminUsersController < ApplicationController
  # Before filter that ensures only one admin user can sign up
  # (for Heroku deployment)
  before_filter :admin_restrictions, :only => [:new, :create]

  # GET /admin_user/new
  def new
    @admin_user = AdminUser.new
  end
  
  # POST /admin_users
  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      @admin_user.admin_user_roles.create(:name => "admin_user")
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  # GET /admin_users/1/edit
  def edit
    @admin_user = current_user
  end
  
  # PUT /admin_users/1
  def update
    @admin_user = current_user
    if @admin_user.update_attributes(params[:admin_user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => :edit
    end
  end
  
  private
  
  # Method run as before filter that ensures only one admin user can sign up
  # through the UI
  def admin_restrictions
    unless AdminUser.find(:all).empty?
      redirect_to login_path, :notice => "Admin user already exists"
    end
  end
end

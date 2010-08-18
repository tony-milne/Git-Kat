class AdminUsersController < ApplicationController
  #before_filter :admin_restrictions, :only => [:new, :create]

 def new
    @admin_user = AdminUser.new
  end
  
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
  
  def edit
    @admin_user = current_user
  end
  
  def update
    @admin_user = current_user
    if @admin_user.update_attributes(params[:admin_user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => :edit
    end
  end
end

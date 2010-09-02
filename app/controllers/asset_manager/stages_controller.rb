# Languages controller handles actions relating to languages
# Contains additional actions for adding/removing users from a stage,
# adding/removing assets from a stage and viewing and agreeing to the contract

class AssetManager::StagesController < ApplicationController
  # Declarative authorization method to enable permissions based filtering of
  # show action.  Allows checking of the @stage variable to see if stage is
  # associated with currently logged in user
  filter_access_to :show, :attribute_check => true
  
  # Declarative authorization method to enable permissions based filtering of
  # actions. Doesn't automatically load stages.
  filter_access_to :all
  
  # Before filter check to see if current asset user has agreed to contract
  # before viewing stage
  before_filter :agreed_to_contract?, :only => :show
  
  # Provides access to s3_authenticated_url in views
  helper AssetManager::AssetsHelper
  
  # GET /stages
  # GET /stages.xml
  def index
    @stages = Stage.with_permissions_to(:read).paginate :per_page => 6, :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stages }
    end
  end

  # GET /stages/1
  # GET /stages/1.xml  
  def show
    @stage = Stage.find(params[:id])
    @assets = @stage.assets.paginate :per_page => 12, :page => params[:page],
                                     :conditions => ['title like ?', "%#{params[:search]}%"],
                                     :order => 'title'
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/new
  # GET /stages/new.xml
  def new
    @stage = Stage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/1/edit
  def edit
    @stage = Stage.find(params[:id])
  end

  # POST /stages
  # POST /stages.xml
  def create
    @stage = Stage.new(params[:stage])

    respond_to do |format|
      if @stage.save
        format.html { redirect_to(asset_manager_stage_path(@stage), :notice => 'Stage was successfully created.') }
        format.xml  { render :xml => @stage, :status => :created, :location => @stage }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stages/1
  # PUT /stages/1.xml
  def update
    @stage = Stage.find(params[:id])

    respond_to do |format|
      if @stage.update_attributes(params[:stage])
        format.html { redirect_to(asset_manager_stage_path(@stage), :notice => 'Stage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.xml
  def destroy
    @stage = Stage.find(params[:id])
    @stage.destroy
    session[:stage_id] = nil

    respond_to do |format|
      format.html { redirect_to(asset_manager_stages_url) }
      format.xml  { head :ok }
    end
  end
  
  ## Asset index stage code
  
  # PUT /stages/add_asset_to_stage
  #
  # Action that adds assets passed in asset_ids array from asset index view.
  # Adds only assets which are not currently in the stage.
  def add_asset_to_stage
    if !params[:asset_ids].nil?
      @stage = Stage.find(session[:stage_id])
      asset_set = Set.new
      params[:asset_ids].each do |asset_id|
        asset_set.add(Asset.find(asset_id.to_i))
      end
      asset_set.each do |new_asset|
        @stage.assets.each do |current_asset|
          if current_asset.id == new_asset.id
            asset_set.delete(new_asset)
            break
          end
        end
      end
      
      asset_set.each do |asset|
        @stage.assets << asset
      end
      
      if @stage.save
        redirect_to :back, :notice =>"Successfully added to the stage."
      else
        redirect_to :back, :error => "Assets were not added to the stage."
      end
    else
      redirect_to :back, :alert => "No assets were selected"
    end
  end
  
  # PUT /stages/1/remove_asset_from_stage
  #
  # Action removes assets passed in asset_ids from stage show view.
  def remove_asset_from_stage
    @stage = Stage.find(params[:id])
    params[:asset_ids].each { |asset|
    @stage.assets.delete(Asset.find(asset)) }
    if @stage.save
      redirect_to :back, :notice =>"Successfully deleted from stage."
    else
      redirect_to :back, :notice => "An error occured"
    end
  end

  ## Contract code

  # GET /stages/1/contract
  #
  # Action displays contact associated with current stage
  def contract
    @stage = Stage.find(params[:id])
    @contract = @stage.contract
  end
  
  # GET /stages/1/agree
  #
  # Action sets agree condition in StageUser record to true
  def agree
    stage = Stage.find(params[:id])
    user = StageUser.find(:first, :conditions => ["asset_user_id = ? AND stage_id =?", current_user.id, stage.id])
    user.has_agreed_to_contract = true
    if user.save
      redirect_to asset_manager_stage_path(stage)
    else
      redirect_to contract_asset_manager_stage_path(stage)
    end
  end
  
  # Stage user code
  
  # GET /stages/1/manage_users
  #
  # Action displays users currently allowed to view the current stage
  def manage_users
    @stage = Stage.find(params[:id])
    @users = @stage.asset_users
  end
  
  # POST /stages/1/add_user
  #
  # Action that adds user to current stage
  def add_user
    stage = Stage.find(params[:id])
    user = AssetUser.find(params[:user][:id])
    stage.asset_users << user
    
    if stage.save
      redirect_to :back, :notice => "#{user.username} was added to #{stage.title}"
    else
      redirect_to :back, :alert => "Action could not be completed"
    end
  end
  
  # POST /stages/1/remove_user
  #
  # Action that removes user(s) from current stage
  def remove_user
    if !params[:user_ids].nil?
      stage = Stage.find(params[:id])
      params[:user_ids].each do |user_id|
        user = AssetUser.find(user_id.to_i)
        stage.asset_users.delete(user)
      end
      if stage.save
        redirect_to :back, :notice => "Users successfully were removed from #{stage.title}"
      else
        redirect_to :back, :alert => "Action could not be completed"
      end
    else
      redirect_to :back, :alert => "No users were selected"
    end
  end
  
  private
  
  # Method called as before filter that checks if current asset user has
  # agreed to an associated contract (if available,) before allowing stage to
  # be viewed.
  def agreed_to_contract?
    if current_user.class.to_s.eql? "AssetUser"
      stage = Stage.find(params[:id])
      stage_user = StageUser.find(:first, :conditions => ["stage_id = ? AND asset_user_id = ?", stage.id, current_user.id])
      if stage_user.has_agreed_to_contract == false
        if stage.contract
          redirect_to contract_asset_manager_stage_path(stage)
        end
      end
    end
  end
end

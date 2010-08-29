class AssetManager::StagesController < ApplicationController
  filter_access_to :show, :attribute_check => true
  filter_access_to :all
  before_filter :agreed_to_contract?, :only => :show
  helper AssetManager::AssetsHelper
  
  # GET /stages
  # GET /stages.xml
  def index
    @stage = Stage.all
    @stages = Stage.paginate :per_page => 6, :page => params[:page]#,
                             #:conditions => ['id like ?', "%#{params[:search]}%"],
                             #:order => 'id'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stages }
    end
  end

  # GET /stages/1
  # GET /stages/1.xml
  # SHOW PAGE TO_BE_PAGINATED!
  
  def show
    @stage = Stage.find(params[:id])
    @assets = Asset.paginate :per_page => 6, :page => params[:page],
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
        format.html { render :action => "new" }
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
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.xml
  def destroy
    @stage = Stage.find(params[:id])
    @stage.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_stages_url) }
      format.xml  { head :ok }
    end
  end
  
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

  def manage_contract
    @stage = Stage.find(params[:id])
    @contract = @stage.contract
  end
  
  def set_contract
    @stage = Stage.find(params[:id])
    @stage.contract = Contract.find(params[:contract][:id])
    
    respond_to do |format|
      if @stage.save
        redirect_to :manage_contract_asset_manager_stage_path, :notice => "Stage successfully updated"
      else
        redirect_to :manage_contract_asset_manager_stage_path
      end
    end
  end

  def contract
    @stage = Stage.find(params[:id])
    @contract = @stage.contract
  end

  def remove_asset_from_stage
    @stage = Stage.find(params[:stage])
    params[:asset_ids].each { |asset|
    @stage.assets.delete(Asset.find(asset)) }
    if @stage.save
      redirect_to :back, :notice =>"Successfully deleted from stage."
    else
      redirect_to :back, :notice => "An error occured"
    end
  end
  
  def manage_users
    @stage = Stage.find(params[:id])
    @users = @stage.asset_users
  end
  
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
  
  def agreed_to_contract?
    #if current_user.class.eql? "asset_user"
      stage = Stage.find(params[:id])
      stage_user = StageUser.find(:first, :conditions => ["stage_id = ? AND asset_user_id = ?", stage.id, current_user.id])
      if stage_user.has_agreed_to_contract == false
        if stage.contract
          redirect_to asset_manager_stage_contract_path(stage)
        end
      end
    #end
  end
end

class AssetManager::CreditsController < AssetManager::ApplicationController
  filter_resource_access
  
  # GET /asset_manager_credits
  # GET /asset_manager_credits.xml
  def index
    @credits = Credit.find(:all, :conditions => ["asset_id = ?", params[:asset_id]])
    @asset = Asset.find(params[:asset_id])
    @languages = Language.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asset_manager_credits }
    end
  end

  # GET /asset_manager_credits/1
  # GET /asset_manager_credits/1.xml
  def show
    #@credit = Credit.find(params[:id])
	  @language = Language.find(:all)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => asset_manager_credit_path(@credit) }
    end
  end

  # GET /asset_manager_credits/new
  # GET /asset_manager_credits/new.xml
  def new
    #@credit = Credit.new
  	@asset = Asset.find(params[:asset_id])
    @credit.asset = @asset
    @languages = Language.find(:all) 
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => asset_manager_credit_path(@credit) }
    end
  end

  # GET /asset_manager_credits/1/edit
  def edit
    #@credit = Credit.find(params[:id])
    @languages = Language.find(:all)
    
  end

  # POST /asset_manager_credits
  # POST /asset_manager_credits.xml
  def create
  	#@credit = Credit.new(params[:credit])
    @asset = Asset.find(params[:asset_id])
  	@credit.asset = @asset
  	@languages = Language.find(:all)

    respond_to do |format|
      if @credit.save
        format.html { redirect_to(asset_manager_asset_credits_path(@credit.asset_id), :notice => 'Credit was successfully created.') }
        format.xml  { render :xml => asset_manager_asset_credit_path(@credit), :status => :created, :location => @credit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => asset_manager_asset_credit_path(@credit.errors), :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asset_manager_credits/1
  # PUT /asset_manager_credits/1.xml
  def update
    #@credit = Credit.find(params[:id])

    respond_to do |format|
      if @credit.update_attributes(params[:credit])
        format.html { redirect_to(asset_manager_asset_credits_path(@credit.asset_id), :notice => 'Credit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @credit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_manager_credits/1
  # DELETE /asset_manager_credits/1.xml
  def destroy
    #@credit = Credit.find(params[:id])
    @credit.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_asset_credits_path(@credit.asset.id)) }
      format.xml  { head :ok }
    end
  end
end

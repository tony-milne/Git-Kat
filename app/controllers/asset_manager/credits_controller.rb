# Credits controller handles actions relating to credits when javascript is
# disabled

class AssetManager::CreditsController < AssetManager::ApplicationController
  # Declarative authorization method to enable permissions based filtering of
  # actions. Doesn't automatically load credits.
  filter_access_to :all
  
  # GET /credits
  # GET /credits.xml
  def index
    @asset = Asset.find(params[:asset_id])
    @credits = @asset.credits
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @credits }
    end
  end

  # GET /credits/1
  # GET /credits/1.xml
  def show
    @asset = Asset.find(params[:asset_id])
    @credit = Credit.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => asset_manager_asset_credit_path(@asset, @credit) }
    end
  end

  # GET /credits/new
  # GET /credits/new.xml
  def new
  	@asset = Asset.find(params[:asset_id])
    @credit = @asset.credits.build
    #@languages = Language.find(:all) 
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => asset_manager_asset_credit_path(@asset, @credit) }
    end
  end

  # GET /credits/1/edit
  def edit
    @asset = Asset.find(params[:asset_id])
    @credit = @asset.credits.find(params[:id])
  end

  # POST /credits
  # POST /credits.xml
  def create
    @asset = Asset.find(params[:asset_id])
    @credit = @asset.credits.build(params[:credit])

    respond_to do |format|
      if @credit.save
        format.html { redirect_to(asset_manager_asset_credit_path(@asset, @credit), :notice => 'Credit was successfully created.') }
        format.xml  { render :xml => asset_manager_asset_credit_path(@asset, @credit), :status => :created, :location => @credit }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @credit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /credits/1
  # PUT /credits/1.xml
  def update
    @asset = Asset.find(params[:asset_id])
    @credit = @asset.credits.find(params[:id])

    respond_to do |format|
      if @credit.update_attributes(params[:credit])
        format.html { redirect_to(asset_manager_asset_credit_path(@asset, @credit), :notice => 'Credit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @credit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.xml
  def destroy
    @asset = Asset.find(params[:asset_id])
    @credit = @asset.credits.find(params[:id])
    @credit.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_asset_credits_path(@asset)) }
      format.xml  { head :ok }
    end
  end
end

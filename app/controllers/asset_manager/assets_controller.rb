class AssetManager::AssetsController < AssetManager::ApplicationController
  before_filter :verify_credentials
  
  # GET /assets
  # GET /assets.xml
  def index
    @assets = Asset.search(params[:search], params[:page])
    
    respond_to do |format|
       format.html #index.html.erb
       format.xml { render :xml => @assets }
    end
  end
  
  def gallery
    @assets = Asset.search(params[:search], params[:page])
  end

  # GET /assets/1
  # GET /assets/1.xml
  def show
    @asset = Asset.find(params[:id])
    if @asset.exif?
    	@exif = @asset.exif.attributes
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asset }
    end
  end
  
  # GET /assets/new
  # GET /assets/new.xml
  def new
    @asset = Asset.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
    @tags = @asset.tags
  end

  # POST /assets
  # POST /assets.xml
  def create
    @asset = Asset.new(params[:asset])
    
    respond_to do |format|
      if @asset.save
        format.html { redirect_to(asset_manager_asset_path(@asset), :notice => 'Asset was successfully created.') }
        format.xml  { render :xml => @asset, :status => :created, :location => @asset }
      else
        format.html { render :action => :new, :notice => 'Asset was not created.' }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assets/1
  # PUT /assets/1.xml
  def update
    params[:asset][:updated_tag_attributes] ||= {}
    @asset = Asset.find(params[:id])
    
    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        format.html { redirect_to(asset_manager_asset_path(@asset), :notice => 'Asset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.xml
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    
    respond_to do |format|
      format.html { redirect_to(asset_manager_assets_path) }
      format.xml  { head :ok }
    end
  end
  
  def add_tag
    @tag = Tag.new
  end

end

class AssetManager::CaptionsController < AssetManager::ApplicationController
  # GET /asset_manager_captions
  # GET /asset_manager_captions.xml
  def index
    @captions = Caption.find(:all, :conditions => ["asset_id = ?", params[:asset_id]])
    @asset = Asset.find(params[:asset_id])
    @languages = Language.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asset_manager_captions }
    end
  end

  # GET /asset_manager_captions/1
  # GET /asset_manager_captions/1.xml
  def show
    @caption = Caption.find(params[:id])
    @languages = Language.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => asset_manager_asset_caption_path(@asset) }
    end
  end

  # GET /asset_manager_captions/new
  # GET /asset_manager_captions/new.xml
  def new
    @asset = Asset.find(params[:asset_id])
    @caption = Caption.new
    @caption.asset = @asset
    @languages = Language.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => asset_manager_caption_path(@caption) }
    end
  end

  # GET /asset_manager_captions/1/edit
  def edit
    #@asset = Asset.find(params[:asset_id])
    @caption = AssetManager::Caption.find(params[:id])
    @languages = Language.find(:all)
  end

  # POST /asset_manager_captions
  # POST /asset_manager_captions.xml
  def create
    @asset = Asset.find(params[:asset_id])
    @caption = Caption.new(params[:caption])
    @caption.asset = @asset
    @languages = Language.find(:all)

    respond_to do |format|
      if @caption.save
        format.html { redirect_to(asset_manager_asset_captions_path(@caption.asset_id), :notice => 'Caption was successfully created.') }
        format.xml  { render :xml => asset_manager_asset_caption_path(@caption), :status => :created, :location => @caption }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => asset_manager_asset_caption_path(@caption.errors), :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asset_manager_captions/1
  # PUT /asset_manager_captions/1.xml
  def update
    @caption = AssetManager::Caption.find(params[:id])

    respond_to do |format|
      if @caption.update_attributes(params[:caption])
        format.html { redirect_to(asset_manager_asset_captions_path(@caption.asset_id), :notice => 'Caption was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @caption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_manager_captions/1
  # DELETE /asset_manager_captions/1.xml
  def destroy
    @caption = AssetManager::Caption.find(params[:id])
    @caption.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_asset_captions_path(@caption.asset_id)) }
      format.xml  { head :ok }
    end
  end
end

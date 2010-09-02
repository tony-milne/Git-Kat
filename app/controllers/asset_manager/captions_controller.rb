# Captions controller handles actions relating to captions when javascript is
# disabled

class AssetManager::CaptionsController < AssetManager::ApplicationController
  # Declarative authorization method to enable permissions based filtering of
  # actions. Doesn't automatically load captions.
  filter_access_to :all
  
  # GET /captions
  # GET /captions.xml
  def index
    @asset = Asset.find(params[:asset_id])
    @captions = @asset.captions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @captions }
    end
  end

  # GET /captions/1
  # GET /captions/1.xml
  def show
    @asset = Asset.find(params[:asset_id])
    @caption = @asset.captions.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => asset_manager_asset_caption_path(@asset, @caption) }
    end
  end

  # GET /captions/new
  # GET /captions/new.xml
  def new
    @asset = Asset.find(params[:asset_id])
    @caption = @asset.captions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @caption }
    end
  end

  # GET /captions/1/edit
  def edit
    @asset = Asset.find(params[:asset_id])
    @caption = @asset.captions.find(params[:id])
  end

  # POST /captions
  # POST /captions.xml
  def create
    @asset = Asset.find(params[:asset_id])
    @caption = @asset.captions.build(params[:caption])

    respond_to do |format|
      if @caption.save
        format.html { redirect_to(asset_manager_asset_captions_path(@asset), :notice => 'Caption was successfully created.') }
        format.xml  { render :xml => asset_manager_asset_captions_path(@asset), :status => :created, :location => @caption }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @caption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /captions/1
  # PUT /captions/1.xml
  def update
    @asset = Asset.find(params[:asset_id])
    @caption = @asset.captions.find(params[:id])
    
    respond_to do |format|
      if @caption.update_attributes(params[:caption])
        format.html { redirect_to(asset_manager_asset_captions_path(@asset), :notice => 'Caption was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @caption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /captions/1
  # DELETE /captions/1.xml
  def destroy
    @asset = Asset.find(params[:asset_id])
    @caption = @asset.captions.find(params[:id])
    @caption.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_asset_captions_path(@asset)) }
      format.xml  { head :ok }
    end
  end
end

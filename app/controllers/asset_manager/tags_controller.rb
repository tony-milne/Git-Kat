# Tags controller handles actions relating to tags when javascript is disabled

class AssetManager::TagsController < AssetManager::ApplicationController
  # Declarative authorization method to enable permissions based filtering of
  # actions.  Doesn't automatically load tags.
  filter_access_to :all
  
  # GET /tags
  # GET /tags.xml
  def index
    @asset = Asset.find(params[:asset_id])
    @tags = @asset.tags
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.xml
  def show
    @asset = Asset.find(params[:asset_id])
    @tag = @asset.tags.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => asset_manager_asset_tag_path(@asset, @tag) }
    end
  end

  # GET /tags/new
  # GET /tags/new.xml
  def new
    @asset = Asset.find(params[:asset_id])
  	@tag = @asset.tags.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => asset_manager_tag_path(@tag) }
    end
  end

  # GET /tags/1/edit
  def edit
    @asset = Asset.find(params[:asset_id])
    @tag = @asset.tags.find(params[:id])
  end

  # POST /tags
  # POST /tags.xml
  def create
    @asset = Asset.find(params[:asset_id])
  	@tag = @asset.tags.build(params[:tag])

    respond_to do |format|
      if @asset.save
        format.html { redirect_to(asset_manager_asset_tag_path(@asset, @tag), :notice => 'Tag was successfully created.') }
        format.xml  { render :xml => asset_manager_asset_tag_path(@asset, @tag), :status => :created, :location => @tag }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @asset = Asset.find(params[:asset_id])
    @tag = @asset.tags.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(asset_manager_asset_tags_path(@tag.asset_id), :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @asset = Asset.find(params[:asset_id])
    @tag = @asset.tags.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_asset_tags_path(@asset)) }
      format.xml  { head :ok }
    end
  end
end

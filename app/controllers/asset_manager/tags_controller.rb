class AssetManager::TagsController < AssetManager::ApplicationController
  # GET /asset_manager_tags
  # GET /asset_manager_tags.xml
  def index
    @tags = Tag.find(:all, :conditions => ["asset_id = ?", params[:asset_id]])
	@asset = Asset.find(params[:asset_id])
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asset_manager_tags }
    end
  end

  # GET /asset_manager_tags/1
  # GET /asset_manager_tags/1.xml
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => asset_manager_asset_tag_path(@tag) }
    end
  end

  # GET /asset_manager_tags/new
  # GET /asset_manager_tags/new.xml
  def new
    @asset = Asset.find(params[:asset_id])
  	@tag = Tag.new
  	@tag.asset = @asset

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => asset_manager_tag_path(@tag) }
    end
  end

  # GET /asset_manager_tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /asset_manager_tags
  # POST /asset_manager_tags.xml
  def create
    @asset = Asset.find(params[:asset_id])
  	@tag = Tag.new(params[:tag])
  	@tag.asset = @asset

    respond_to do |format|
      if @tag.save
        format.html { redirect_to(asset_manager_asset_tags_path(@tag.asset_id), :notice => 'Tag was successfully created.') }
        format.xml  { render :xml => asset_manager_asset_tag_path(@tag), :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => asset_manager_asset_tag_path(@tag.errors), :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asset_manager_tags/1
  # PUT /asset_manager_tags/1.xml
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(asset_manager_asset_tags_path(@tag.asset_id), :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_manager_tags/1
  # DELETE /asset_manager_tags/1.xml
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_asset_tags_path(@tag.asset_id)) }
      format.xml  { head :ok }
    end
  end
end

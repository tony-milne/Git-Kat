class AssetManager::AssetsController < AssetManager::ApplicationController
  #before_filter :verify_credentials
  filter_access_to :all
  #filter_resource_access
  helper AssetManager::AssetsHelper
  
  # GET /assets
  # GET /assets.xml
  def index
    @assets = Asset.search(params[:search], params[:page])
    @stages = Stage.find(:all) #added by merge
    #@countries = Country.find(:all)

    respond_to do |format|
       format.html #index.html.erb
       format.xml { render :xml => @assets }
    end
  end

  # GET /assets/1
  # GET /assets/1.xml
  def show
    @asset = Asset.find(params[:id])
    #@countries = Country.find(:all)
    if @asset.exif?
    	@exif = @asset.exif.attributes
    	@exif = format_exif(@exif)
   end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => asset_manager_asset_path(@asset) }
    end
  end
  
  # GET /assets/new
  # GET /assets/new.xml
  def new
    @asset = Asset.new
    @countries = Country.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    #@asset = Asset.find(params[:id])
    @countries = Country.find(:all)
    @tags = @asset.tags
  end

  # POST /assets
  # POST /assets.xml
  def create
    @asset = Asset.new(params[:asset])
    @countries = Country.find(:all)
    
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
    params[:asset][:updated_caption_attributes] ||= {}
    params[:asset][:updated_credit_attributes] ||= {}
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

  def select_stage
    if !params[:stage][:id].empty?
      session[:stage_id] = params[:stage][:id].to_i
      redirect_to :back, :notice => "You can now add assets to #{Stage.find(session[:stage_id]).title}"
    else
      redirect_to :back, :notice => "No stage was selected"
    end
  end
  
  def deselect_stage
    session[:stage_id] = nil
    redirect_to :back, :notice => "Please select a different stage"
  end
  
  private
  
  def format_exif(exif)
    exif.reject! { |key,value| (key.eql? "id") || (value == 0.0) || (value.blank?) }
	    
    exif.each_pair { |key,value| 
    new_key = key.to_s.dup
    new_key.gsub!("_", " ")
    new_key.capitalize!

    if new_key.eql? "Shot date time"
      new_value = @asset.exif.shot_date_time.strftime("%d %b %Y %H:%M")
    else
      new_value = value.to_s.dup
    end

    exif.delete(key)
    exif.store(new_key, new_value) }
    
    return exif
  end

end

# Tribes controller handles actions relating to tribes

class AssetManager::TribesController < AssetManager::ApplicationController
  # Declarative authorization method to enable permissions based filtering of
  # actions. Automatically loads tribes based on params[:id]
  filter_resource_access
  
  # GET /tribes
  # GET /tribes.xml
  def index
    @tribes = Tribe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asset_manager_tribes }
    end
  end

  # GET /tribes/1
  # GET /tribes/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tribe }
    end
  end

  # GET /tribes/new
  # GET /tribes/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tribe }
    end
  end

  # GET /tribes/1/edit
  def edit
    
  end

  # POST /tribes
  # POST /tribes.xml
  def create
    respond_to do |format|
      if @tribe.save
        format.html { redirect_to(asset_manager_tribe_path(@tribe), :notice => 'Tribe was successfully created.') }
        format.xml  { render :xml => asset_manager_tribe_path(@tribe), :status => :created, :location => @tribe }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @tribe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tribes/1
  # PUT /tribes/1.xml
  def update
    respond_to do |format|
      if @tribe.update_attributes(params[:tribe])
        format.html { redirect_to(asset_manager_tribe_path(@tribe), :notice => 'Tribe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @tribe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tribes/1
  # DELETE /tribes/1.xml
  def destroy
    @tribe.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_tribes_url) }
      format.xml  { head :ok }
    end
  end
end

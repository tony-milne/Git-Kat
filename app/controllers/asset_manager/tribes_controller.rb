class AssetManager::TribesController < AssetManager::ApplicationController
  # GET /asset_manager_tribes
  # GET /asset_manager_tribes.xml
  def index
    @tribes = Tribe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asset_manager_tribes }
    end
  end

  # GET /asset_manager_tribes/1
  # GET /asset_manager_tribes/1.xml
  def show
    @tribe = Tribe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tribe }
    end
  end

  # GET /asset_manager_tribes/new
  # GET /asset_manager_tribes/new.xml
  def new
    @tribe = AssetManager::Tribe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tribe }
    end
  end

  # GET /asset_manager_tribes/1/edit
  def edit
    @tribe = Tribe.find(params[:id])
  end

  # POST /asset_manager_tribes
  # POST /asset_manager_tribes.xml
  def create
    @tribe = Tribe.new(params[:tribe])

    respond_to do |format|
      if @tribe.save
        format.html { redirect_to(asset_manager_tribe_path(@tribe), :notice => 'Tribe was successfully created.') }
        format.xml  { render :xml => asset_manager_tribe_path(@tribe), :status => :created, :location => @tribe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => asset_manager_tribe_path(@tribe.errors), :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asset_manager_tribes/1
  # PUT /asset_manager_tribes/1.xml
  def update
    @tribe = Tribe.find(params[:id])

    respond_to do |format|
      if @tribe.update_attributes(params[:tribe])
        format.html { redirect_to(asset_manager_tribe_path(@tribe), :notice => 'Tribe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tribe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_manager_tribes/1
  # DELETE /asset_manager_tribes/1.xml
  def destroy
    @tribe = Tribe.find(params[:id])
    @tribe.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_tribes_url) }
      format.xml  { head :ok }
    end
  end
end

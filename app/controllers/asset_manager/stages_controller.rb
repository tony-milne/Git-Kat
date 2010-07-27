class AssetManager::StagesController < ApplicationController
  # GET /stages
  # GET /stages.xml
  def index
    @stage = Stage.all
       @stages = Stage.paginate :per_page => 6, :page => params[:page],
                             :conditions => ['id like ?', "%#{params[:search]}%"],
                             :order => 'id'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stages }
    end
  end

  # GET /stages/1
  # GET /stages/1.xml
  # SHOW PAGE TO_BE_PAGINATED!
  
  def show
    @stage = Stage.find(params[:id])
@assets = Asset.paginate :per_page => 6, :page => params[:page],
                             :conditions => ['title like ?', "%#{params[:search]}%"],
                             :order => 'title'
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/new
  # GET /stages/new.xml
  def new
    @stage = Stage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/1/edit
  def edit
    @stage = Stage.find(params[:id])
  end

  # POST /stages
  # POST /stages.xml
  def create
    @stage = Stage.new(params[:stage])

    respond_to do |format|
      if @stage.save
        format.html { redirect_to(asset_manager_stage_path(@stage), :notice => 'Stage was successfully created.') }
        format.xml  { render :xml => @stage, :status => :created, :location => @stage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stages/1
  # PUT /stages/1.xml
  def update
    @stage = Stage.find(params[:id])

    respond_to do |format|
      if @stage.update_attributes(params[:stage])
        format.html { redirect_to(asset_manager_stage_path(@stage), :notice => 'Stage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.xml
  def destroy
    @stage = Stage.find(params[:id])
    @stage.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_stages_url) }
      format.xml  { head :ok }
    end
  end
  
def added
@stage = Stage.find(params[:stage][:stage_id])
params[:asset_ids].each { |asset|
@stage.assets << Asset.find(asset) }
@stage.save
redirect_to :back, :notice =>"Successfully added to the stage."
end

def removed
@stage = Stage.find(params[:stage])
params[:asset_ids].each { |asset|
@stage.assets.delete(Asset.find(asset)) }
@stage.save
redirect_to :back, :notice =>"Successfully deleted from stage."

end
end

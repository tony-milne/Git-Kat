class StageItemsController < ApplicationController
  # GET /stage_items
  # GET /stage_items.xml
  def index
    @stage_items = StageItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stage_items }
    end
  end

  # GET /stage_items/1
  # GET /stage_items/1.xml
  def show
    @stage_item = StageItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage_item }
    end
  end

  # GET /stage_items/new
  # GET /stage_items/new.xml
  def new
    @stage_item = StageItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage_item }
    end
  end

  # GET /stage_items/1/edit
  def edit
    @stage_item = StageItem.find(params[:id])
  end

  # POST /stage_items
  # POST /stage_items.xml
  def create
    @stage_item = StageItem.new(params[:stage_item])

    respond_to do |format|
      if @stage_item.save
        format.html { redirect_to(@stage_item, :notice => 'StageItem was successfully created.') }
        format.xml  { render :xml => @stage_item, :status => :created, :location => @stage_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stage_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stage_items/1
  # PUT /stage_items/1.xml
  def update
    @stage_item = StageItem.find(params[:id])

    respond_to do |format|
      if @stage_item.update_attributes(params[:stage_item])
        format.html { redirect_to(@stage_item, :notice => 'StageItem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_items/1
  # DELETE /stage_items/1.xml
  def destroy
    @stage_item = StageItem.find(params[:id])
    @stage_item.destroy

    respond_to do |format|
      format.html { redirect_to(stage_items_url) }
      format.xml  { head :ok }
    end
  end
end

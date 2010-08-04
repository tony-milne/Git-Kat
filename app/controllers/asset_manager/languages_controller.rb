class AssetManager::LanguagesController < AssetManager::ApplicationController
  # GET /asset_manager_languages
  # GET /asset_manager_languages.xml
  def index
    @languages = Language.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asset_manager_languages }
    end
  end

  # GET /asset_manager_languages/1
  # GET /asset_manager_languages/1.xml
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @language }
    end
  end

  # GET /asset_manager_languages/new
  # GET /asset_manager_languages/new.xml
  def new
    @language = Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @language }
    end
  end

  # GET /asset_manager_languages/1/edit
  def edit
    @language = Language.find(params[:id])
  end

  # POST /asset_manager_languages
  # POST /asset_manager_languages.xml
  def create
    @language = Language.new(params[:language])

    respond_to do |format|
      if @language.save
        format.html { redirect_to(asset_manager_language_path(@language), :notice => 'Language was successfully created.') }
        format.xml  { render :xml => asset_manager_language_path(@language), :status => :created, :location => @language }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => asset_manager_language_path(@language.errors), :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asset_manager_languages/1
  # PUT /asset_manager_languages/1.xml
  def update
    @language = AssetManager::Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to(asset_manager_language_path(@language), :notice => 'Language was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_manager_languages/1
  # DELETE /asset_manager_languages/1.xml
  def destroy
    @language = AssetManager::Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_languages_url) }
      format.xml  { head :ok }
    end
  end
end

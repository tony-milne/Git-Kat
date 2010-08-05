class AssetManager::CountriesController < AssetManager::ApplicationController
  # GET /asset_manager_countries
  # GET /asset_manager_countries.xml
  def index
    @countries = Country.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asset_manager_countries }
    end
  end

  # GET /asset_manager_countries/1
  # GET /asset_manager_countries/1.xml
  def show
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /asset_manager_countries/new
  # GET /asset_manager_countries/new.xml
  def new
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => asset_manager_country_path(@country) }
    end
  end

  # GET /asset_manager_countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /asset_manager_countries
  # POST /asset_manager_countries.xml
  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to(asset_manager_country_path(@country), :notice => 'Country was successfully created.') }
        format.xml  { render :xml => asset_manager_country_path(@country), :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => asset_manager_country_path(@country.errors), :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asset_manager_countries/1
  # PUT /asset_manager_countries/1.xml
  def update
    @country = AssetManager::Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to(asset_manager_country_path(@country), :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => asset_manager_country_path(@country.errors), :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_manager_countries/1
  # DELETE /asset_manager_countries/1.xml
  def destroy
    @country = AssetManager::Country.find(params[:id])
    @country.destroy

    respond_to do |format|
      format.html { redirect_to(asset_manager_countries_url) }
      format.xml  { head :ok }
    end
  end
end

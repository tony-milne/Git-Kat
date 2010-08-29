class AssetManager::ContractsController < ApplicationController
  def index
    @contracts = Contract.find(:all)
    
    respond_to do |format|
      format.html #index.html.erb
      #format.xml { render :xml => }
    end
  end

  def new
    #@stage = Stage.find(params[:stage_id])
    #@contract = @stage.contracts.build
    @contract = Contract.new
    
    respond_to do |format|
      format.html #new.html.erb
      #format.xml
    end
  end

  def edit
    #@stage = Stage.find(params[:stage_id])
    #@contract = @stage.contract
    @contract = Contract.find(params[:id])
  end

  def show
    #@stage = Stage.find(params[:stage_id])
    #@contract = @stage.contract
    @contract = Contract.find(params[:id])
    
    respond_to do |format|
      format.html #show.html.erb
      #format.xml
    end
  end

  def create
    #@stage = Stage.find(params[:stage_id])
    #@contract = @stage.contracts.build
    @contract = Contract.new(params[:contract])
    
    respond_to do |format|
      if @contract.save
        format.html { redirect_to asset_manager_contract_path(@contract), :notice => "Contract successfully created" }
        #format.xml
      else
        format.html { render :action => :new } #redirect_to new_asset_manager_stage_contract
        #format.xml
      end
    end
  end
  
  def update
    #@stage = Stage.find(params[:stage_id])
    #@contract = @stage.contract
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @stage.update_attributes(params[:contract])
        format.html { redirect_to(asset_manager_contract_path(@contract), :notice => 'Contract was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    #@stage = Stage.find(params[:stage_id])
    #@contract = @stage.contract
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to asset_manager_contracts_path }
      format.xml  { head :ok }
    end
  end

end

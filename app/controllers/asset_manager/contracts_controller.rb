# Contracts controller handles actions relating to contracts

class AssetManager::ContractsController < ApplicationController
  # Declarative authorization method to enable permissions based filtering of
  # actions. Automatically loads contracts based on params[:id]
  filter_resource_access
  
  # GET /contracts
  # GET /contracts.xml
  def index
    @contracts = Contract.find(:all)
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @contracts}
    end
  end

  # GET /contracts/new
  # GET /contracts/new.xml
  def new    
    respond_to do |format|
      format.html #new.html.erb
      format.xml { render :xml => asset_manager_contract_path(@contract) }
    end
  end

  # GET /contracts/edit
  def edit
    
  end

  # GET /contracts/1
  # GET /contracts/1.xml
  def show
    respond_to do |format|
      format.html #show.html.erb
      format.xml { render :xml => asset_manager_contract_path(@contract) }
    end
  end

  # POST /contracts
  # POST /contracts.xml
  def create
    respond_to do |format|
      if @contract.save
        format.html { redirect_to asset_manager_contract_path(@contract), :notice => "Contract successfully created" }
        format.xml { render :xml => asset_manager_contract_path(@contract), :status => :created, :location => @contract }
      else
        format.html { render :action => :new }
        format.xml { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /contracts/1
  # PUT /contract/1.xml
  def update
    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to(asset_manager_contract_path(@contract), :notice => 'Contract was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /contracts/1
  # DELETE /contracts/1.xml
  def destroy
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to asset_manager_contracts_path }
      format.xml  { head :ok }
    end
  end

end

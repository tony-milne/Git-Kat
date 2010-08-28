class AddContractIdToStages < ActiveRecord::Migration
  def self.up
    add_column :stages, :contract_id, :integer
  end

  def self.down
    remove_column :stages, :contract_id
  end
end

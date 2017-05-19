class AddColumnSettlementIdToCourier < ActiveRecord::Migration[5.0]
  def change
  	add_column :couriers, :settlement_id, :integer
  end
end

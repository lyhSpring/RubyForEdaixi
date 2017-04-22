class AddColumnStationIdIntoUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :station_id, :integer
  end
end

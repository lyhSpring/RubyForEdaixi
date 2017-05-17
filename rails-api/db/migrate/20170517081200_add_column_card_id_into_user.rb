class AddColumnCardIdIntoUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :card_id, :integer
  end
end

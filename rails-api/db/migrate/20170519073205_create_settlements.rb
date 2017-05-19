class CreateSettlements < ActiveRecord::Migration[5.0]
  def change
    create_table :settlements do |t|
      t.integer :settled
      t.integer :unsettled
      t.integer :money_settled
      t.integer :money_unsettled
      t.integer :courier_id

      t.timestamps
    end
  end
end

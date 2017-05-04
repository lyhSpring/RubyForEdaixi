class CreateWaybills < ActiveRecord::Migration[5.0]
  def change
    create_table :waybills do |t|
      t.string :sender_type
      t.integer :sender_id
      t.integer :status
      t.integer :recieve_id
      t.datetime :exp_time
      t.datetime :actual_time
      t.integer :waybill_id
      t.integer :order_id

      t.timestamps
    end
  end
end

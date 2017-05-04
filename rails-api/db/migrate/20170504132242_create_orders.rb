class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :courier_id
      t.integer :washing_status
      t.integer :factory_id
      t.integer :waybill_id
      t.integer :voucher_status
      t.integer :categories_id
      t.integer :status
      t.integer :address_id
      t.decimal :totalprice
      t.integer :user_id

      t.timestamps
    end
  end
end

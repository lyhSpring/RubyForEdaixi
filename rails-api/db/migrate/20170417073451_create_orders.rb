class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :time_exp
      t.string :washing_status
      t.string :address
      t.decimal :total_price

      t.timestamps
    end
  end
end

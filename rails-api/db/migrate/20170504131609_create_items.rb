class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :product_number
      t.decimal :total_price

      t.timestamps
    end
  end
end

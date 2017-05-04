class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.decimal :price1
      t.decimal :price2
      t.decimal :price3
      t.integer :product_id

      t.timestamps
    end
  end
end
